# dvd logo simulator in python
# jobega was here 

import pygame
import random


pygame.init()

width, height = 800, 600
screen = pygame.display.set_mode((width, height))
pygame.display.set_caption("DVD Logo Simulator")

black = (0, 0, 0)
white = (255, 255, 255)

dvd_logo = pygame.image.load("dvd_logo.png")  
dvd_logo = pygame.transform.scale(dvd_logo, (100, 60))

logo_rect = dvd_logo.get_rect()
logo_rect.topleft = (random.randint(0, width - logo_rect.width), random.randint(0, height - logo_rect.height))
speed = [5, 5]

# Main game loop
running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    logo_rect.x += speed[0]
    logo_rect.y += speed[1]

    if logo_rect.left < 0 or logo_rect.right > width:
        speed[0] = -speed[0]
    if logo_rect.top < 0 or logo_rect.bottom > height:
        speed[1] = -speed[1]
      
    screen.fill(black)
    screen.blit(dvd_logo, logo_rect)
    pygame.display.flip()
    pygame.time.Clock().tick(60)


pygame.quit()
