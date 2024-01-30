#!/usr/bin/env python3
#jobega was here

import pygame
import random


pygame.init()


WIDTH, HEIGHT = 800, 600
FPS = 60
SPEED = 5

screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("DVD Player Simulator")


dvd_logo = pygame.image.load("dvd_logo.png").convert_alpha()
DVD_WIDTH, DVD_HEIGHT = dvd_logo.get_width(), dvd_logo.get_height()


original_logo = dvd_logo.copy()

x = random.randint(0, WIDTH - DVD_WIDTH)
y = random.randint(0, HEIGHT - DVD_HEIGHT)
dx, dy = SPEED, SPEED
direction = (dx, dy)

clock = pygame.time.Clock()

running = True
while running:
    screen.fill((0, 0, 0))  


    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False


    x += direction[0]
    y += direction[1]

    if x <= 0 or x >= WIDTH - DVD_WIDTH:
        direction = (-direction[0], direction[1])
       
        new_color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))
        temp_logo = original_logo.copy()  
        temp_logo.fill(new_color, special_flags=pygame.BLEND_RGB_MULT)  
        dvd_logo = temp_logo  
    if y <= 0 or y >= HEIGHT - DVD_HEIGHT:
        direction = (direction[0], -direction[1])
        new_color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))
        temp_logo = original_logo.copy()  
        temp_logo.fill(new_color, special_flags=pygame.BLEND_RGB_MULT)  
        dvd_logo = temp_logo  

    screen.blit(dvd_logo, (x, y))

    pygame.display.flip()
    clock.tick(FPS)

pygame.quit()
