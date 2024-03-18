package com.mygdx.game;

import com.badlogic.gdx.ApplicationAdapter;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.utils.ScreenUtils;

import java.util.Random;


public class DvdSim extends ApplicationAdapter {


	SpriteBatch batch;
	Texture img;
	Random rand = new Random();
	int x = rand.nextInt(1920);
	int y = rand.nextInt(1080);
	int xspeed = 3;
	int yspeed = 3;
	String[] colors = {"dvd_logo1.png", "dvd_logo2.png", "dvd_logo3.png", "dvd_logo4.png", "dvd_logo5.png", "dvd_logo6.png","dvd_logo7.png"};

	@Override
	public void create () {
		batch = new SpriteBatch();
		img = new Texture(colors[rand.nextInt(6)]);
	}

	@Override
	public void render () {
		ScreenUtils.clear(0, 0, 0, 1);

		x += xspeed;
		y += -yspeed;

		if (x >= 1920 - img.getWidth()) {
			x = 1920 - img.getWidth();
			xspeed = -xspeed;
			img = new Texture(colors[rand.nextInt(6)]);
		}
		if (x <= 0) {
			x = 0;
			xspeed = -xspeed;
			img = new Texture(colors[rand.nextInt(6)]);
		}
		if (y >= 1020 - img.getHeight()) {
			y = 1020 - img.getHeight();
			yspeed = -yspeed;
			img = new Texture(colors[rand.nextInt(6)]);
		}
		if (y <= 0) {
			y = 0;
			yspeed = -yspeed;
			img = new Texture(colors[rand.nextInt(6)]);
		}


		batch.begin();
		batch.draw(img, x, y);
		batch.end();
	}

	@Override
	public void dispose () {
		batch.dispose();
		img.dispose();
	}
}
