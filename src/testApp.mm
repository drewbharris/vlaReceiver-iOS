#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
	ofSetOrientation(OF_ORIENTATION_90_LEFT);

	// listen on the given port
	cout << "listening for UDP messages\n";
	receiver.setup( PORT );

	current_msg_string = 0;
	mouseX = 0;
	mouseY = 0;
	mouseButtonState = "";
    
    //create the socket and bind to port 11999
	udpConnection.Create();
	udpConnection.Bind(11999);
	udpConnection.SetNonBlocking(true);
    udpConnection.SetEnableBroadcast(true);
    
    

	ofBackground( 30, 30, 130 );
    
    val = 0;
}

//--------------------------------------------------------------
void testApp::update(){
    
    char udpMessage[1000];
    string message;
    string tempMessage;
    bool getNext = true;
    
    while (getNext) {
        udpConnection.Receive(udpMessage,1000);
        tempMessage=udpMessage;
        
        if (tempMessage=="") {
            getNext = false;
        }
        else {
            message = tempMessage;
        }
    }
    
    if(message!=""){
        recieved_val = atof(ofToString(message).c_str());
        if (recieved_val < 256)  {
            val = 2*recieved_val;
        }
    }

    	
}

//--------------------------------------------------------------
void testApp::draw(){
	string buf;
    
    ofBackground(val, val, val);
    
    //ofDrawBitmapString(ofToString(recieved_val), 30, 40);

	
}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void testApp::lostFocus(){

}

//--------------------------------------------------------------
void testApp::gotFocus(){

}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){

}
