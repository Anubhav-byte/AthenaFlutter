package com.anubhav.athena

import android.speech.tts.TextToSpeech
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.util.*

class MainActivity: FlutterActivity(),TextToSpeech.OnInitListener{
    private val CHANNEL = "com.anubhav.dev/tts"
    private var tts: TextToSpeech? = null

    override fun onInit(status: Int) {
        if (status == TextToSpeech.SUCCESS) {
            // set UK English as language for tts
            val result = tts!!.setLanguage(Locale.UK)

            if (result == TextToSpeech.LANG_MISSING_DATA || result == TextToSpeech.LANG_NOT_SUPPORTED) {
                println("TTS - The Language specified is not supported!")
            }
        } else {
            println("TTS Initialization Failed!")
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        tts = TextToSpeech(this,this)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,CHANNEL).setMethodCallHandler{
            call, result ->
            if (call.method == "playAudio"){
                val data = call.argument<String>("data")
                val response  = playAudio(data)
                if(response == TextToSpeech.SUCCESS)
                    result.success(response)
                else
                    result.success(1)

            }
            if(call.method == "stopAudio"){
                val response  = stopAudio()
                if(response == TextToSpeech.SUCCESS)
                    result.success(response)
                else
                    result.success(1)
            }

            if(call.method == "exportFile"){

                println("Inside ExportFile")
                val data  = call.argument<String>("data")
                val fileName = call.argument<String>("fileName")
                println(data)
                println(fileName)
                val audioFile : File = File(applicationContext.filesDir,"$fileName.mp3")


                if(tts!!.synthesizeToFile(data,null,audioFile,null) == TextToSpeech.SUCCESS){
                    Toast.makeText(context,"File Saved", Toast.LENGTH_SHORT).show()
                    println(audioFile.absolutePath)
                    result.success(audioFile.absolutePath)
                }else{
                    Toast.makeText(context,"Failed To Save File" , Toast.LENGTH_SHORT).show()
                    result.success("Failed")
                }

            }



        }
    }

    private fun playAudio(data: String?): Int {
        println("trying to play")
        return tts!!.speak(data, TextToSpeech.QUEUE_FLUSH, null, "")
    }

    private fun stopAudio(): Int {
        println("stopping audio")
        return tts!!.stop()
    }
}
