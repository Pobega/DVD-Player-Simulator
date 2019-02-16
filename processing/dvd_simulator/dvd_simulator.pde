color[] colors = {
  color(255, 0, 0),
  color(0, 255, 0),
  color(0, 0, 255),
  color(255, 255, 0),
  color(0, 255, 255),
  color(255, 0, 255)
};

color current_color = color(255, 0, 0);
PImage logo;

int SPEED = 6;

int vx, vy;
int x_pos, y_pos;

void setup() {
  // standard DVD resolution?
  // https://en.wikipedia.org/wiki/DVD-Video#Video_data
  size(720, 480);
  
  // pick random initial directions
  // I know this isn't a perfect 50/50 split
  int x_dir = random(1) > .5 ? 1 : -1;
  int y_dir = random(1) > .5 ? 1 : -1;
  
  vx = x_dir * SPEED;
  vy = y_dir * SPEED;
  
  x_pos = width/2;
  y_pos = height/2;
  
  // set up our image
  logo = loadImage("assets/dvd_logo.png");
}

void draw() {
  background(0);
  
  x_pos += vx;
  y_pos += vy;
  
  boolean bounced = false;
  if (x_pos > width - logo.width || x_pos < 0) {
    vx *= -1;
    bounced = true;
  }
  if (y_pos > height - logo.height || y_pos < 0) {
    vy *= -1;
    bounced = true;
  }
  
  if(bounced) {
    change_color();
  }
  
  tint(current_color);
  image(logo, x_pos, y_pos);
}

void change_color(){
  int random_index;
  int last_color = current_color; 
  // always pick a different color than before
  while(current_color == last_color) {
    random_index = floor(random(colors.length));
    current_color = colors[random_index];
  }
}
