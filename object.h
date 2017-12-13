#include "geometry.h"

#ifndef OBJECT_H
#define OBJECT_H
uint8 sysTick_flag =0;


typedef struct tObject
{
    GeometryPtr         geo;
    int8                dirx, diry;
    int8                posx, posy;
    void                (*draw) (struct tObject *);
    void                (*clear) (struct tObject *);
    void                (*move) (struct tObject *,struct tObject *);
    void                (*set_speed) (struct tObject *, int8 speedx, int8 speedy);
} Object, *ObjectPtr;

void set_object_speed(ObjectPtr obj, int8 speedx, int8 speedy)
{
    obj->dirx = speedx;
    obj->diry = speedy;
}

void update_object(ObjectPtr obj, ObjectPtr bar)
{
    obj->clear(obj);
    obj->posx = obj->posx + obj->dirx;
    obj->posy = obj->posy + obj->diry;

    if(obj->posx < 1){
		obj->dirx = -obj->dirx;
	}
	
	if(obj->posx + obj->geo->sizex > 128){
		sysTick_flag = 1;
	}

	if(obj->posx + obj->geo->sizex > bar->posx && obj->posx < bar->posx + bar->geo->sizex){
		if(obj->posy + obj->geo->sizey > bar->posy && obj->posy < bar->posy + bar->geo->sizey ){
			obj->dirx = -obj->dirx;
		}
	}
	
	/*
	if(obj->posx < bar->posx + bar->geo->sizex && obj->posx + obj->geo->sizex > bar->posx && obj->posy + obj->geo->sizey > bar->posy && obj->posy > bar->posy + bar->geo->sizey ){
			obj->dirx = -obj->dirx;
		}
	*/
    if(obj->posy < 1 || obj->posy + obj->geo->sizey > 64)
        obj->diry = -obj->diry;

    obj->draw(obj);
}
void update_bar_object(ObjectPtr obj,ObjectPtr obj2)
{
    obj->clear(obj);
    obj->posx = obj->posx + obj->dirx;
	
	if((obj->posy + obj->geo->sizey > 62 && obj->diry > 0) || (obj->posy < 1 && obj->diry < 0)){}
	else
	obj->posy = obj->posy + obj->diry;

    obj->draw(obj);
	obj->diry = 0;
}
#endif // OBJECT_H
