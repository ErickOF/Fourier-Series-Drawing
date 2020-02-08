float time;
int n = 20;
ArrayList<Float> wave = new ArrayList();

void setup(){
    size(1200, 600);
    time = 0;
}

void draw() {
    background(0);
    translate(300, 300);
    
    float x = 0;
    float y = 0;
    
    for (int i = 0; i < n; i++) {
        float previousx = x;
        float previousy = y;

        int k = 2 * i + 1;
        float radius = 100 * (4 / (k * PI));
        
        x += radius * cos(k * time);
        y += radius * sin(k * time);
        
        stroke(255 - i * 255/(n - 2), 100);
        noFill();
        ellipse(previousx, previousy, 2 * radius, 2 * radius);
        
        fill(255 - i * 255 / (n - 2));
        stroke(255 - i * 255 / (n - 2));
        line(previousx, previousy, x, y);
    }
    
    wave.add(0, y);

    translate(450, 0);
    line(x - 450, y, 0, wave.get(0));
    
    beginShape();
    noFill();
    stroke(255);
    
    for (int i = 0; i < wave.size(); i++) {
        vertex(i, wave.get(i));
    }
    
    endShape();

    time += 0.05;
    
    if (wave.size() > 450) {
        wave.remove(wave.size() - 1);
    }

}
