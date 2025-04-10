int year = 2025;

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
Serial.print("Time machine sending you to year: ");
Serial.println(year);

// add year + 10 
year += 10;

// add 1 to year
year ++;
}
