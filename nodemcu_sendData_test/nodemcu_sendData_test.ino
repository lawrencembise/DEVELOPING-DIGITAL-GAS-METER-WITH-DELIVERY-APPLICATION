#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>
#include "HX711.h"

                                                // HX711 circuit wiring
const int LOADCELL_DOUT_PIN = 12;
const int LOADCELL_SCK_PIN = 13;

                                                // Set these to run example.
#define FIREBASE_HOST "mtungi-chap-chap-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "kcFyDR2G45oc4ZqkctrpysTfQwLoYEg9mI8YI8rA"
#define WIFI_SSID "ljm"
#define WIFI_PASSWORD "turskerivory"

HX711 scale;
int Gas_analog = A0;    
int Gas_digital = 0;   

void setup() {
  Serial.begin(9600);
  pinMode(Gas_analog, INPUT);
  pinMode(Gas_digital, INPUT);


  Serial.println("Initializing the scale...");
  scale.begin(LOADCELL_DOUT_PIN, LOADCELL_SCK_PIN);

  Serial.println(scale.read());                 // print a raw reading from the ADC

  Serial.println(scale.read_average(20));       // print the average of 20 readings from the ADC

  Serial.println(scale.get_value(5));           // print the average of 5 readings from the ADC minus the tare weight (not set yet)

  Serial.println(scale.get_units(5), 1);        // print the average of 5 readings from the ADC minus tare weight (not set) divided
                                                // by the SCALE parameter (not set yet)
            
  scale.set_scale(102);
  scale.tare();                                 // reset the scale to 0

  Serial.println(scale.read());                 // print a raw reading from the ADC

  Serial.println(scale.read_average(20));       // print the average of 20 readings from the ADC

  Serial.println(scale.get_value(5));           // print the average of 5 readings from the ADC minus the tare weight, set with tare()

  Serial.println(scale.get_units(5), 1);        // print the average of 5 readings from the ADC minus tare weight, divided
                                                // by the SCALE parameter set with set_scale

  
 
                                                // connect to wifi.
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  Firebase.set("users/R8gQX0279rbVsfMqSUNLZcsbpNg2/leakageSensor", 0);
  Firebase.set("users/R8gQX0279rbVsfMqSUNLZcsbpNg2/level", 0);

  
}

float sensorInit = 0.0;

void loop() {
  
  Serial.print("\t| GasLevel:\t");
  Serial.println(scale.get_units(10), 5);
  Firebase.setFloat("users/R8gQX0279rbVsfMqSUNLZcsbpNg2/level", scale.get_units(10));

  float gassensorAnalog = analogRead(Gas_analog);
  float gassensorDigital = digitalRead(Gas_digital);
  Serial.print("\t| GasLeakage: ");
  Serial.print(gassensorAnalog);
  Serial.println("\t");
  Serial.print("\t| GasClass: ");
  Serial.println(gassensorDigital);

  Firebase.setFloat("users/R8gQX0279rbVsfMqSUNLZcsbpNg2/leakage", gassensorAnalog);
  
  delay(200);
}
