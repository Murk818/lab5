   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"startup.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.global	sysTick_flag
  16              		.bss
  19              	sysTick_flag:
  20 0000 00       		.space	1
  21              		.text
  22              		.align	1
  23              		.global	set_object_speed
  24              		.syntax unified
  25              		.code	16
  26              		.thumb_func
  27              		.fpu softvfp
  29              	set_object_speed:
  30              	.LFB0:
  31              		.file 1 "C:/Users/Murk/Documents/Moplaborationer/lab5/object.h"
   1:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** #include "geometry.h"
   2:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 
   3:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** #ifndef OBJECT_H
   4:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** #define OBJECT_H
   5:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** uint8 sysTick_flag =0;
   6:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 
   7:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 
   8:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** typedef struct tObject
   9:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** {
  10:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****     GeometryPtr         geo;
  11:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****     int8                dirx, diry;
  12:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****     int8                posx, posy;
  13:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****     void                (*draw) (struct tObject *);
  14:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****     void                (*clear) (struct tObject *);
  15:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****     void                (*move) (struct tObject *,struct tObject *);
  16:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****     void                (*set_speed) (struct tObject *, int8 speedx, int8 speedy);
  17:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** } Object, *ObjectPtr;
  18:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 
  19:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** void set_object_speed(ObjectPtr obj, int8 speedx, int8 speedy)
  20:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** {
  32              		.loc 1 20 0
  33              		.cfi_startproc
  34              		@ args = 0, pretend = 0, frame = 8
  35              		@ frame_needed = 1, uses_anonymous_args = 0
  36 0000 80B5     		push	{r7, lr}
  37              		.cfi_def_cfa_offset 8
  38              		.cfi_offset 7, -8
  39              		.cfi_offset 14, -4
  40 0002 82B0     		sub	sp, sp, #8
  41              		.cfi_def_cfa_offset 16
  42 0004 00AF     		add	r7, sp, #0
  43              		.cfi_def_cfa_register 7
  44 0006 7860     		str	r0, [r7, #4]
  45 0008 0800     		movs	r0, r1
  46 000a 1100     		movs	r1, r2
  47 000c FB1C     		adds	r3, r7, #3
  48 000e 021C     		adds	r2, r0, #0
  49 0010 1A70     		strb	r2, [r3]
  50 0012 BB1C     		adds	r3, r7, #2
  51 0014 0A1C     		adds	r2, r1, #0
  52 0016 1A70     		strb	r2, [r3]
  21:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****     obj->dirx = speedx;
  53              		.loc 1 21 0
  54 0018 7B68     		ldr	r3, [r7, #4]
  55 001a FA1C     		adds	r2, r7, #3
  56 001c 1278     		ldrb	r2, [r2]
  57 001e 1A71     		strb	r2, [r3, #4]
  22:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****     obj->diry = speedy;
  58              		.loc 1 22 0
  59 0020 7B68     		ldr	r3, [r7, #4]
  60 0022 BA1C     		adds	r2, r7, #2
  61 0024 1278     		ldrb	r2, [r2]
  62 0026 5A71     		strb	r2, [r3, #5]
  23:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** }
  63              		.loc 1 23 0
  64 0028 C046     		nop
  65 002a BD46     		mov	sp, r7
  66 002c 02B0     		add	sp, sp, #8
  67              		@ sp needed
  68 002e 80BD     		pop	{r7, pc}
  69              		.cfi_endproc
  70              	.LFE0:
  72              		.align	1
  73              		.global	update_object
  74              		.syntax unified
  75              		.code	16
  76              		.thumb_func
  77              		.fpu softvfp
  79              	update_object:
  80              	.LFB1:
  24:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 
  25:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** void update_object(ObjectPtr obj, ObjectPtr bar)
  26:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** {
  81              		.loc 1 26 0
  82              		.cfi_startproc
  83              		@ args = 0, pretend = 0, frame = 8
  84              		@ frame_needed = 1, uses_anonymous_args = 0
  85 0030 80B5     		push	{r7, lr}
  86              		.cfi_def_cfa_offset 8
  87              		.cfi_offset 7, -8
  88              		.cfi_offset 14, -4
  89 0032 82B0     		sub	sp, sp, #8
  90              		.cfi_def_cfa_offset 16
  91 0034 00AF     		add	r7, sp, #0
  92              		.cfi_def_cfa_register 7
  93 0036 7860     		str	r0, [r7, #4]
  94 0038 3960     		str	r1, [r7]
  27:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****     obj->clear(obj);
  95              		.loc 1 27 0
  96 003a 7B68     		ldr	r3, [r7, #4]
  97 003c DB68     		ldr	r3, [r3, #12]
  98 003e 7A68     		ldr	r2, [r7, #4]
  99 0040 1000     		movs	r0, r2
 100 0042 9847     		blx	r3
 101              	.LVL0:
  28:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****     obj->posx = obj->posx + obj->dirx;
 102              		.loc 1 28 0
 103 0044 7B68     		ldr	r3, [r7, #4]
 104 0046 9B79     		ldrb	r3, [r3, #6]
 105 0048 5BB2     		sxtb	r3, r3
 106 004a DAB2     		uxtb	r2, r3
 107 004c 7B68     		ldr	r3, [r7, #4]
 108 004e 1B79     		ldrb	r3, [r3, #4]
 109 0050 5BB2     		sxtb	r3, r3
 110 0052 DBB2     		uxtb	r3, r3
 111 0054 D318     		adds	r3, r2, r3
 112 0056 DBB2     		uxtb	r3, r3
 113 0058 5AB2     		sxtb	r2, r3
 114 005a 7B68     		ldr	r3, [r7, #4]
 115 005c 9A71     		strb	r2, [r3, #6]
  29:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****     obj->posy = obj->posy + obj->diry;
 116              		.loc 1 29 0
 117 005e 7B68     		ldr	r3, [r7, #4]
 118 0060 DB79     		ldrb	r3, [r3, #7]
 119 0062 5BB2     		sxtb	r3, r3
 120 0064 DAB2     		uxtb	r2, r3
 121 0066 7B68     		ldr	r3, [r7, #4]
 122 0068 5B79     		ldrb	r3, [r3, #5]
 123 006a 5BB2     		sxtb	r3, r3
 124 006c DBB2     		uxtb	r3, r3
 125 006e D318     		adds	r3, r2, r3
 126 0070 DBB2     		uxtb	r3, r3
 127 0072 5AB2     		sxtb	r2, r3
 128 0074 7B68     		ldr	r3, [r7, #4]
 129 0076 DA71     		strb	r2, [r3, #7]
  30:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 
  31:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****     if(obj->posx < 1){
 130              		.loc 1 31 0
 131 0078 7B68     		ldr	r3, [r7, #4]
 132 007a 9B79     		ldrb	r3, [r3, #6]
 133 007c 5BB2     		sxtb	r3, r3
 134 007e 002B     		cmp	r3, #0
 135 0080 08DC     		bgt	.L3
  32:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 		obj->dirx = -obj->dirx;
 136              		.loc 1 32 0
 137 0082 7B68     		ldr	r3, [r7, #4]
 138 0084 1B79     		ldrb	r3, [r3, #4]
 139 0086 5BB2     		sxtb	r3, r3
 140 0088 DBB2     		uxtb	r3, r3
 141 008a 5B42     		rsbs	r3, r3, #0
 142 008c DBB2     		uxtb	r3, r3
 143 008e 5AB2     		sxtb	r2, r3
 144 0090 7B68     		ldr	r3, [r7, #4]
 145 0092 1A71     		strb	r2, [r3, #4]
 146              	.L3:
  33:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 	}
  34:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 	
  35:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 	if(obj->posx + obj->geo->sizex > 128){
 147              		.loc 1 35 0
 148 0094 7B68     		ldr	r3, [r7, #4]
 149 0096 9B79     		ldrb	r3, [r3, #6]
 150 0098 5BB2     		sxtb	r3, r3
 151 009a 1A00     		movs	r2, r3
 152 009c 7B68     		ldr	r3, [r7, #4]
 153 009e 1B68     		ldr	r3, [r3]
 154 00a0 5B78     		ldrb	r3, [r3, #1]
 155 00a2 D318     		adds	r3, r2, r3
 156 00a4 802B     		cmp	r3, #128
 157 00a6 02DD     		ble	.L4
  36:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 		sysTick_flag = 1;
 158              		.loc 1 36 0
 159 00a8 314B     		ldr	r3, .L8
 160 00aa 0122     		movs	r2, #1
 161 00ac 1A70     		strb	r2, [r3]
 162              	.L4:
  37:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 	}
  38:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 
  39:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 	if(obj->posx + obj->geo->sizex > bar->posx && obj->posx < bar->posx + bar->geo->sizex){
 163              		.loc 1 39 0
 164 00ae 7B68     		ldr	r3, [r7, #4]
 165 00b0 9B79     		ldrb	r3, [r3, #6]
 166 00b2 5BB2     		sxtb	r3, r3
 167 00b4 1A00     		movs	r2, r3
 168 00b6 7B68     		ldr	r3, [r7, #4]
 169 00b8 1B68     		ldr	r3, [r3]
 170 00ba 5B78     		ldrb	r3, [r3, #1]
 171 00bc D318     		adds	r3, r2, r3
 172 00be 3A68     		ldr	r2, [r7]
 173 00c0 9279     		ldrb	r2, [r2, #6]
 174 00c2 52B2     		sxtb	r2, r2
 175 00c4 9342     		cmp	r3, r2
 176 00c6 31DD     		ble	.L5
 177              		.loc 1 39 0 is_stmt 0 discriminator 1
 178 00c8 7B68     		ldr	r3, [r7, #4]
 179 00ca 9B79     		ldrb	r3, [r3, #6]
 180 00cc 5BB2     		sxtb	r3, r3
 181 00ce 1A00     		movs	r2, r3
 182 00d0 3B68     		ldr	r3, [r7]
 183 00d2 9B79     		ldrb	r3, [r3, #6]
 184 00d4 5BB2     		sxtb	r3, r3
 185 00d6 1900     		movs	r1, r3
 186 00d8 3B68     		ldr	r3, [r7]
 187 00da 1B68     		ldr	r3, [r3]
 188 00dc 5B78     		ldrb	r3, [r3, #1]
 189 00de CB18     		adds	r3, r1, r3
 190 00e0 9A42     		cmp	r2, r3
 191 00e2 23DA     		bge	.L5
  40:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 		if(obj->posy + obj->geo->sizey > bar->posy && obj->posy < bar->posy + bar->geo->sizey ){
 192              		.loc 1 40 0 is_stmt 1
 193 00e4 7B68     		ldr	r3, [r7, #4]
 194 00e6 DB79     		ldrb	r3, [r3, #7]
 195 00e8 5BB2     		sxtb	r3, r3
 196 00ea 1A00     		movs	r2, r3
 197 00ec 7B68     		ldr	r3, [r7, #4]
 198 00ee 1B68     		ldr	r3, [r3]
 199 00f0 9B78     		ldrb	r3, [r3, #2]
 200 00f2 D318     		adds	r3, r2, r3
 201 00f4 3A68     		ldr	r2, [r7]
 202 00f6 D279     		ldrb	r2, [r2, #7]
 203 00f8 52B2     		sxtb	r2, r2
 204 00fa 9342     		cmp	r3, r2
 205 00fc 16DD     		ble	.L5
 206              		.loc 1 40 0 is_stmt 0 discriminator 1
 207 00fe 7B68     		ldr	r3, [r7, #4]
 208 0100 DB79     		ldrb	r3, [r3, #7]
 209 0102 5BB2     		sxtb	r3, r3
 210 0104 1A00     		movs	r2, r3
 211 0106 3B68     		ldr	r3, [r7]
 212 0108 DB79     		ldrb	r3, [r3, #7]
 213 010a 5BB2     		sxtb	r3, r3
 214 010c 1900     		movs	r1, r3
 215 010e 3B68     		ldr	r3, [r7]
 216 0110 1B68     		ldr	r3, [r3]
 217 0112 9B78     		ldrb	r3, [r3, #2]
 218 0114 CB18     		adds	r3, r1, r3
 219 0116 9A42     		cmp	r2, r3
 220 0118 08DA     		bge	.L5
  41:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 			obj->dirx = -obj->dirx;
 221              		.loc 1 41 0 is_stmt 1
 222 011a 7B68     		ldr	r3, [r7, #4]
 223 011c 1B79     		ldrb	r3, [r3, #4]
 224 011e 5BB2     		sxtb	r3, r3
 225 0120 DBB2     		uxtb	r3, r3
 226 0122 5B42     		rsbs	r3, r3, #0
 227 0124 DBB2     		uxtb	r3, r3
 228 0126 5AB2     		sxtb	r2, r3
 229 0128 7B68     		ldr	r3, [r7, #4]
 230 012a 1A71     		strb	r2, [r3, #4]
 231              	.L5:
  42:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 		}
  43:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 	}
  44:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 	
  45:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 	/*
  46:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 	if(obj->posx < bar->posx + bar->geo->sizex && obj->posx + obj->geo->sizex > bar->posx && obj->posy
  47:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 			obj->dirx = -obj->dirx;
  48:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 		}
  49:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 	*/
  50:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****     if(obj->posy < 1 || obj->posy + obj->geo->sizey > 64)
 232              		.loc 1 50 0
 233 012c 7B68     		ldr	r3, [r7, #4]
 234 012e DB79     		ldrb	r3, [r3, #7]
 235 0130 5BB2     		sxtb	r3, r3
 236 0132 002B     		cmp	r3, #0
 237 0134 09DD     		ble	.L6
 238              		.loc 1 50 0 is_stmt 0 discriminator 1
 239 0136 7B68     		ldr	r3, [r7, #4]
 240 0138 DB79     		ldrb	r3, [r3, #7]
 241 013a 5BB2     		sxtb	r3, r3
 242 013c 1A00     		movs	r2, r3
 243 013e 7B68     		ldr	r3, [r7, #4]
 244 0140 1B68     		ldr	r3, [r3]
 245 0142 9B78     		ldrb	r3, [r3, #2]
 246 0144 D318     		adds	r3, r2, r3
 247 0146 402B     		cmp	r3, #64
 248 0148 08DD     		ble	.L7
 249              	.L6:
  51:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****         obj->diry = -obj->diry;
 250              		.loc 1 51 0 is_stmt 1
 251 014a 7B68     		ldr	r3, [r7, #4]
 252 014c 5B79     		ldrb	r3, [r3, #5]
 253 014e 5BB2     		sxtb	r3, r3
 254 0150 DBB2     		uxtb	r3, r3
 255 0152 5B42     		rsbs	r3, r3, #0
 256 0154 DBB2     		uxtb	r3, r3
 257 0156 5AB2     		sxtb	r2, r3
 258 0158 7B68     		ldr	r3, [r7, #4]
 259 015a 5A71     		strb	r2, [r3, #5]
 260              	.L7:
  52:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 
  53:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****     obj->draw(obj);
 261              		.loc 1 53 0
 262 015c 7B68     		ldr	r3, [r7, #4]
 263 015e 9B68     		ldr	r3, [r3, #8]
 264 0160 7A68     		ldr	r2, [r7, #4]
 265 0162 1000     		movs	r0, r2
 266 0164 9847     		blx	r3
 267              	.LVL1:
  54:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** }
 268              		.loc 1 54 0
 269 0166 C046     		nop
 270 0168 BD46     		mov	sp, r7
 271 016a 02B0     		add	sp, sp, #8
 272              		@ sp needed
 273 016c 80BD     		pop	{r7, pc}
 274              	.L9:
 275 016e C046     		.align	2
 276              	.L8:
 277 0170 00000000 		.word	sysTick_flag
 278              		.cfi_endproc
 279              	.LFE1:
 281              		.align	1
 282              		.global	update_bar_object
 283              		.syntax unified
 284              		.code	16
 285              		.thumb_func
 286              		.fpu softvfp
 288              	update_bar_object:
 289              	.LFB2:
  55:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** void update_bar_object(ObjectPtr obj,ObjectPtr obj2)
  56:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** {
 290              		.loc 1 56 0
 291              		.cfi_startproc
 292              		@ args = 0, pretend = 0, frame = 8
 293              		@ frame_needed = 1, uses_anonymous_args = 0
 294 0174 80B5     		push	{r7, lr}
 295              		.cfi_def_cfa_offset 8
 296              		.cfi_offset 7, -8
 297              		.cfi_offset 14, -4
 298 0176 82B0     		sub	sp, sp, #8
 299              		.cfi_def_cfa_offset 16
 300 0178 00AF     		add	r7, sp, #0
 301              		.cfi_def_cfa_register 7
 302 017a 7860     		str	r0, [r7, #4]
 303 017c 3960     		str	r1, [r7]
  57:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****     obj->clear(obj);
 304              		.loc 1 57 0
 305 017e 7B68     		ldr	r3, [r7, #4]
 306 0180 DB68     		ldr	r3, [r3, #12]
 307 0182 7A68     		ldr	r2, [r7, #4]
 308 0184 1000     		movs	r0, r2
 309 0186 9847     		blx	r3
 310              	.LVL2:
  58:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****     obj->posx = obj->posx + obj->dirx;
 311              		.loc 1 58 0
 312 0188 7B68     		ldr	r3, [r7, #4]
 313 018a 9B79     		ldrb	r3, [r3, #6]
 314 018c 5BB2     		sxtb	r3, r3
 315 018e DAB2     		uxtb	r2, r3
 316 0190 7B68     		ldr	r3, [r7, #4]
 317 0192 1B79     		ldrb	r3, [r3, #4]
 318 0194 5BB2     		sxtb	r3, r3
 319 0196 DBB2     		uxtb	r3, r3
 320 0198 D318     		adds	r3, r2, r3
 321 019a DBB2     		uxtb	r3, r3
 322 019c 5AB2     		sxtb	r2, r3
 323 019e 7B68     		ldr	r3, [r7, #4]
 324 01a0 9A71     		strb	r2, [r3, #6]
  59:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 	
  60:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 	if((obj->posy + obj->geo->sizey > 62 && obj->diry > 0) || (obj->posy < 1 && obj->diry < 0)){}
 325              		.loc 1 60 0
 326 01a2 7B68     		ldr	r3, [r7, #4]
 327 01a4 DB79     		ldrb	r3, [r3, #7]
 328 01a6 5BB2     		sxtb	r3, r3
 329 01a8 1A00     		movs	r2, r3
 330 01aa 7B68     		ldr	r3, [r7, #4]
 331 01ac 1B68     		ldr	r3, [r3]
 332 01ae 9B78     		ldrb	r3, [r3, #2]
 333 01b0 D318     		adds	r3, r2, r3
 334 01b2 3E2B     		cmp	r3, #62
 335 01b4 04DD     		ble	.L11
 336              		.loc 1 60 0 is_stmt 0 discriminator 1
 337 01b6 7B68     		ldr	r3, [r7, #4]
 338 01b8 5B79     		ldrb	r3, [r3, #5]
 339 01ba 5BB2     		sxtb	r3, r3
 340 01bc 002B     		cmp	r3, #0
 341 01be 16DC     		bgt	.L12
 342              	.L11:
 343              		.loc 1 60 0 discriminator 3
 344 01c0 7B68     		ldr	r3, [r7, #4]
 345 01c2 DB79     		ldrb	r3, [r3, #7]
 346 01c4 5BB2     		sxtb	r3, r3
 347 01c6 002B     		cmp	r3, #0
 348 01c8 04DC     		bgt	.L13
 349              		.loc 1 60 0 discriminator 4
 350 01ca 7B68     		ldr	r3, [r7, #4]
 351 01cc 5B79     		ldrb	r3, [r3, #5]
 352 01ce 5BB2     		sxtb	r3, r3
 353 01d0 002B     		cmp	r3, #0
 354 01d2 0CDB     		blt	.L12
 355              	.L13:
  61:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 	else
  62:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 	obj->posy = obj->posy + obj->diry;
 356              		.loc 1 62 0 is_stmt 1
 357 01d4 7B68     		ldr	r3, [r7, #4]
 358 01d6 DB79     		ldrb	r3, [r3, #7]
 359 01d8 5BB2     		sxtb	r3, r3
 360 01da DAB2     		uxtb	r2, r3
 361 01dc 7B68     		ldr	r3, [r7, #4]
 362 01de 5B79     		ldrb	r3, [r3, #5]
 363 01e0 5BB2     		sxtb	r3, r3
 364 01e2 DBB2     		uxtb	r3, r3
 365 01e4 D318     		adds	r3, r2, r3
 366 01e6 DBB2     		uxtb	r3, r3
 367 01e8 5AB2     		sxtb	r2, r3
 368 01ea 7B68     		ldr	r3, [r7, #4]
 369 01ec DA71     		strb	r2, [r3, #7]
 370              	.L12:
  63:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 
  64:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h ****     obj->draw(obj);
 371              		.loc 1 64 0
 372 01ee 7B68     		ldr	r3, [r7, #4]
 373 01f0 9B68     		ldr	r3, [r3, #8]
 374 01f2 7A68     		ldr	r2, [r7, #4]
 375 01f4 1000     		movs	r0, r2
 376 01f6 9847     		blx	r3
 377              	.LVL3:
  65:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** 	obj->diry = 0;
 378              		.loc 1 65 0
 379 01f8 7B68     		ldr	r3, [r7, #4]
 380 01fa 0022     		movs	r2, #0
 381 01fc 5A71     		strb	r2, [r3, #5]
  66:C:/Users/Murk/Documents/Moplaborationer/lab5\object.h **** }
 382              		.loc 1 66 0
 383 01fe C046     		nop
 384 0200 BD46     		mov	sp, r7
 385 0202 02B0     		add	sp, sp, #8
 386              		@ sp needed
 387 0204 80BD     		pop	{r7, pc}
 388              		.cfi_endproc
 389              	.LFE2:
 391              		.section	.start_section,"ax",%progbits
 392              		.align	1
 393              		.global	startup
 394              		.syntax unified
 395              		.code	16
 396              		.thumb_func
 397              		.fpu softvfp
 399              	startup:
 400              	.LFB3:
 401              		.file 2 "C:/Users/Murk/Documents/Moplaborationer/lab5/startup.c"
   1:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** #include "graphicdisplay.h"
   2:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** #include "gpio.h"
   3:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** #include "geometry.h"
   4:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** #include "object.h"
   5:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
   6:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** #define SPEED 3
   7:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** extern uint8 sysTick_flag;
   8:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** /*
   9:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c ****  * 	startup.c
  10:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c ****  *
  11:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c ****  */
  12:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section(".start_section")));
  13:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
  14:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** void drawTest(void);
  15:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** void autopong(void);
  16:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** void ballSteering(void);
  17:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** void out7seg(unsigned char keyValue);
  18:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** void barSteering(uint8 life);
  19:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** uint8 keyb(void);
  20:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
  21:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** void clear_object(ObjectPtr obj);
  22:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** void draw_object(ObjectPtr obj);
  23:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
  24:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** const Geometry ballGeometry = {
  25:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	12,
  26:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	4,4,
  27:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	(Point[MAX_POINTS]){	
  28:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		// Going from left to right, 
  29:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		// using y as the downward axis.
  30:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		{0,1}, {0,2},
  31:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		{1,0}, {1,1}, {1,2}, {1,3},
  32:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		{2,0}, {2,1}, {2,2}, {2,3},
  33:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		{3,1}, {3,2}
  34:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	}
  35:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** };
  36:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** const Geometry barGeometry = {
  37:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	32,
  38:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	2,16,
  39:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	(Point[MAX_POINTS]){	
  40:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		// Going from left to right, 
  41:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		// using y as the downward axis.
  42:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		{0,0}, {0,1}, {0,2}, {0,3},{0,4}, {0,5}, {0,6}, {0,7},{0,8}, {0,9}, {0,10}, {0,11},{0,12}, {0,13}
  43:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		{1,0}, {1,1}, {1,2}, {1,3},{1,4}, {1,5}, {1,6}, {1,7},{1,8}, {1,9}, {1,10}, {1,11},{1,12}, {1,13}
  44:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
  45:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		
  46:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		
  47:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	}
  48:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** };
  49:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
  50:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** Object ball = {
  51:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	&ballGeometry,
  52:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	1,1,
  53:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	118,32,
  54:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	draw_object,
  55:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	clear_object,
  56:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	update_object,
  57:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	set_object_speed
  58:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** };
  59:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** Object bar = {
  60:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	&barGeometry,
  61:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	1,1,
  62:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	126,5,
  63:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	draw_object,
  64:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	clear_object,
  65:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	update_bar_object,
  66:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	set_object_speed
  67:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** };
  68:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
  69:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
  70:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** void startup(void)
  71:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** {
 402              		.loc 2 71 0
 403              		.cfi_startproc
 404              		@ Naked Function: prologue and epilogue provided by programmer.
 405              		@ args = 0, pretend = 0, frame = 0
 406              		@ frame_needed = 1, uses_anonymous_args = 0
  72:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	__asm volatile(
 407              		.loc 2 72 0
 408              		.syntax divided
 409              	@ 72 "C:/Users/Murk/Documents/Moplaborationer/lab5/startup.c" 1
 410 0000 0248     		 LDR R0,=0x2001C000
 411 0002 8546     	 MOV SP,R0
 412 0004 FFF7FEFF 	 BL main
 413 0008 FEE7     	_exit: B .
 414              	
 415              	@ 0 "" 2
  73:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		" LDR R0,=0x2001C000\n" /* set stack */
  74:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		" MOV SP,R0\n"
  75:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		" BL main\n"   /* call main */
  76:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		"_exit: B .\n" /* never return */
  77:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	);
  78:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** }
 416              		.loc 2 78 0
 417              		.thumb
 418              		.syntax unified
 419 000a C046     		nop
 420              		.cfi_endproc
 421              	.LFE3:
 423              		.global	ballGeometry
 424              		.section	.rodata
 425              		.align	2
 428              	ballGeometry:
 429 0000 0C       		.byte	12
 430 0001 04       		.byte	4
 431 0002 04       		.byte	4
 432 0003 00       		.byte	0
 433 0004 01       		.byte	1
 434 0005 00       		.byte	0
 435 0006 02       		.byte	2
 436 0007 01       		.byte	1
 437 0008 00       		.byte	0
 438 0009 01       		.byte	1
 439 000a 01       		.byte	1
 440 000b 01       		.byte	1
 441 000c 02       		.byte	2
 442 000d 01       		.byte	1
 443 000e 03       		.byte	3
 444 000f 02       		.byte	2
 445 0010 00       		.byte	0
 446 0011 02       		.byte	2
 447 0012 01       		.byte	1
 448 0013 02       		.byte	2
 449 0014 02       		.byte	2
 450 0015 02       		.byte	2
 451 0016 03       		.byte	3
 452 0017 03       		.byte	3
 453 0018 01       		.byte	1
 454 0019 03       		.byte	3
 455 001a 02       		.byte	2
 456 001b 00000000 		.space	56
 456      00000000 
 456      00000000 
 456      00000000 
 456      00000000 
 457              		.global	barGeometry
 458 0053 00       		.align	2
 461              	barGeometry:
 462 0054 20       		.byte	32
 463 0055 02       		.byte	2
 464 0056 10       		.byte	16
 465 0057 00       		.byte	0
 466 0058 00       		.byte	0
 467 0059 00       		.byte	0
 468 005a 01       		.byte	1
 469 005b 00       		.byte	0
 470 005c 02       		.byte	2
 471 005d 00       		.byte	0
 472 005e 03       		.byte	3
 473 005f 00       		.byte	0
 474 0060 04       		.byte	4
 475 0061 00       		.byte	0
 476 0062 05       		.byte	5
 477 0063 00       		.byte	0
 478 0064 06       		.byte	6
 479 0065 00       		.byte	0
 480 0066 07       		.byte	7
 481 0067 00       		.byte	0
 482 0068 08       		.byte	8
 483 0069 00       		.byte	0
 484 006a 09       		.byte	9
 485 006b 00       		.byte	0
 486 006c 0A       		.byte	10
 487 006d 00       		.byte	0
 488 006e 0B       		.byte	11
 489 006f 00       		.byte	0
 490 0070 0C       		.byte	12
 491 0071 00       		.byte	0
 492 0072 0D       		.byte	13
 493 0073 00       		.byte	0
 494 0074 0E       		.byte	14
 495 0075 00       		.byte	0
 496 0076 0F       		.byte	15
 497 0077 01       		.byte	1
 498 0078 00       		.byte	0
 499 0079 01       		.byte	1
 500 007a 01       		.byte	1
 501 007b 01       		.byte	1
 502 007c 02       		.byte	2
 503 007d 01       		.byte	1
 504 007e 03       		.byte	3
 505 007f 01       		.byte	1
 506 0080 04       		.byte	4
 507 0081 01       		.byte	1
 508 0082 05       		.byte	5
 509 0083 01       		.byte	1
 510 0084 06       		.byte	6
 511 0085 01       		.byte	1
 512 0086 07       		.byte	7
 513 0087 01       		.byte	1
 514 0088 08       		.byte	8
 515 0089 01       		.byte	1
 516 008a 09       		.byte	9
 517 008b 01       		.byte	1
 518 008c 0A       		.byte	10
 519 008d 01       		.byte	1
 520 008e 0B       		.byte	11
 521 008f 01       		.byte	1
 522 0090 0C       		.byte	12
 523 0091 01       		.byte	1
 524 0092 0D       		.byte	13
 525 0093 01       		.byte	1
 526 0094 0E       		.byte	14
 527 0095 01       		.byte	1
 528 0096 0F       		.byte	15
 529 0097 00000000 		.space	16
 529      00000000 
 529      00000000 
 529      00000000 
 530              		.global	ball
 531              		.data
 532              		.align	2
 535              	ball:
 536 0000 00000000 		.word	ballGeometry
 537 0004 01       		.byte	1
 538 0005 01       		.byte	1
 539 0006 76       		.byte	118
 540 0007 20       		.byte	32
 541 0008 00000000 		.word	draw_object
 542 000c 00000000 		.word	clear_object
 543 0010 00000000 		.word	update_object
 544 0014 00000000 		.word	set_object_speed
 545              		.global	bar
 546              		.align	2
 549              	bar:
 550 0018 00000000 		.word	barGeometry
 551 001c 01       		.byte	1
 552 001d 01       		.byte	1
 553 001e 7E       		.byte	126
 554 001f 05       		.byte	5
 555 0020 00000000 		.word	draw_object
 556 0024 00000000 		.word	clear_object
 557 0028 00000000 		.word	update_bar_object
 558 002c 00000000 		.word	set_object_speed
 559              		.text
 560              		.align	1
 561              		.global	init_app
 562              		.syntax unified
 563              		.code	16
 564              		.thumb_func
 565              		.fpu softvfp
 567              	init_app:
 568              	.LFB4:
  79:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
  80:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** void init_app(void)
  81:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** {
 569              		.loc 2 81 0
 570              		.cfi_startproc
 571              		@ args = 0, pretend = 0, frame = 0
 572              		@ frame_needed = 1, uses_anonymous_args = 0
 573 0206 80B5     		push	{r7, lr}
 574              		.cfi_def_cfa_offset 8
 575              		.cfi_offset 7, -8
 576              		.cfi_offset 14, -4
 577 0208 00AF     		add	r7, sp, #0
 578              		.cfi_def_cfa_register 7
  82:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** #ifdef USBDM
  83:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	*((unsigned long *)0x40023830) = 0x18;
  84:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	__asm volatile(" LDR R0,=0x08000209\n BLX R0 \n");
  85:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** #endif
  86:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
  87:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	GPIO_E.MODER = 0x55555555;
 579              		.loc 2 87 0
 580 020a 104B     		ldr	r3, .L16
 581 020c 104A     		ldr	r2, .L16+4
 582 020e 1A60     		str	r2, [r3]
  88:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	GPIO_E.OSPEEDR = 0x55555555;
 583              		.loc 2 88 0
 584 0210 0E4B     		ldr	r3, .L16
 585 0212 0F4A     		ldr	r2, .L16+4
 586 0214 9A60     		str	r2, [r3, #8]
  89:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	GPIO_E.OTYPER = 0x0;
 587              		.loc 2 89 0
 588 0216 0D4B     		ldr	r3, .L16
 589 0218 0022     		movs	r2, #0
 590 021a 9A80     		strh	r2, [r3, #4]
  90:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	
  91:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	GPIO_D.MODER = 0x55005555;
 591              		.loc 2 91 0
 592 021c 0D4B     		ldr	r3, .L16+8
 593 021e 0E4A     		ldr	r2, .L16+12
 594 0220 1A60     		str	r2, [r3]
  92:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	GPIO_D.OTYPER &= 0x0000;
 595              		.loc 2 92 0
 596 0222 0C4B     		ldr	r3, .L16+8
 597 0224 9B88     		ldrh	r3, [r3, #4]
 598 0226 0B4B     		ldr	r3, .L16+8
 599 0228 0022     		movs	r2, #0
 600 022a 9A80     		strh	r2, [r3, #4]
  93:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	GPIO_D.PUPDR &= 0x0000FFFF;
 601              		.loc 2 93 0
 602 022c 094B     		ldr	r3, .L16+8
 603 022e 094A     		ldr	r2, .L16+8
 604 0230 D268     		ldr	r2, [r2, #12]
 605 0232 1204     		lsls	r2, r2, #16
 606 0234 120C     		lsrs	r2, r2, #16
 607 0236 DA60     		str	r2, [r3, #12]
  94:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	GPIO_D.PUPDR |= 0x00AA0000;
 608              		.loc 2 94 0
 609 0238 064B     		ldr	r3, .L16+8
 610 023a 064A     		ldr	r2, .L16+8
 611 023c D268     		ldr	r2, [r2, #12]
 612 023e AA21     		movs	r1, #170
 613 0240 0904     		lsls	r1, r1, #16
 614 0242 0A43     		orrs	r2, r1
 615 0244 DA60     		str	r2, [r3, #12]
  95:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** }
 616              		.loc 2 95 0
 617 0246 C046     		nop
 618 0248 BD46     		mov	sp, r7
 619              		@ sp needed
 620 024a 80BD     		pop	{r7, pc}
 621              	.L17:
 622              		.align	2
 623              	.L16:
 624 024c 00100240 		.word	1073876992
 625 0250 55555555 		.word	1431655765
 626 0254 000C0240 		.word	1073875968
 627 0258 55550055 		.word	1426085205
 628              		.cfi_endproc
 629              	.LFE4:
 631              		.align	1
 632              		.global	main
 633              		.syntax unified
 634              		.code	16
 635              		.thumb_func
 636              		.fpu softvfp
 638              	main:
 639              	.LFB5:
  96:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
  97:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** void main(void)
  98:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** {
 640              		.loc 2 98 0
 641              		.cfi_startproc
 642              		@ args = 0, pretend = 0, frame = 8
 643              		@ frame_needed = 1, uses_anonymous_args = 0
 644 025c 80B5     		push	{r7, lr}
 645              		.cfi_def_cfa_offset 8
 646              		.cfi_offset 7, -8
 647              		.cfi_offset 14, -4
 648 025e 82B0     		sub	sp, sp, #8
 649              		.cfi_def_cfa_offset 16
 650 0260 00AF     		add	r7, sp, #0
 651              		.cfi_def_cfa_register 7
 652              	.LBB2:
  99:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	// Test for drawing display
 100:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c ****  	 //drawTest();
 101:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 102:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	// Autopong
 103:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	//autopong();
 104:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	
 105:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	// Steer the ball manually
 106:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	//ballSteering();
 107:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	
 108:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	
 109:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	// Steer the bar manually
 110:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	for (uint8 i = 2; i>=0;i--){
 653              		.loc 2 110 0
 654 0262 FB1D     		adds	r3, r7, #7
 655 0264 0222     		movs	r2, #2
 656 0266 1A70     		strb	r2, [r3]
 657              	.L19:
 111:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	barSteering(i+1);
 658              		.loc 2 111 0 discriminator 2
 659 0268 FB1D     		adds	r3, r7, #7
 660 026a 1B78     		ldrb	r3, [r3]
 661 026c 0133     		adds	r3, r3, #1
 662 026e DBB2     		uxtb	r3, r3
 663 0270 1800     		movs	r0, r3
 664 0272 FFF7FEFF 		bl	barSteering
 110:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	barSteering(i+1);
 665              		.loc 2 110 0 discriminator 2
 666 0276 FB1D     		adds	r3, r7, #7
 667 0278 1A78     		ldrb	r2, [r3]
 668 027a FB1D     		adds	r3, r7, #7
 669 027c 013A     		subs	r2, r2, #1
 670 027e 1A70     		strb	r2, [r3]
 671              		.loc 2 111 0 discriminator 2
 672 0280 F2E7     		b	.L19
 673              	.LBE2:
 674              		.cfi_endproc
 675              	.LFE5:
 677              		.align	1
 678              		.global	activateRow
 679              		.syntax unified
 680              		.code	16
 681              		.thumb_func
 682              		.fpu softvfp
 684              	activateRow:
 685              	.LFB6:
 112:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	}
 113:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	
 114:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	
 115:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** }
 116:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 117:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** // x: index of row
 118:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** void activateRow(uint8 x) {
 686              		.loc 2 118 0
 687              		.cfi_startproc
 688              		@ args = 0, pretend = 0, frame = 8
 689              		@ frame_needed = 1, uses_anonymous_args = 0
 690 0282 80B5     		push	{r7, lr}
 691              		.cfi_def_cfa_offset 8
 692              		.cfi_offset 7, -8
 693              		.cfi_offset 14, -4
 694 0284 82B0     		sub	sp, sp, #8
 695              		.cfi_def_cfa_offset 16
 696 0286 00AF     		add	r7, sp, #0
 697              		.cfi_def_cfa_register 7
 698 0288 0200     		movs	r2, r0
 699 028a FB1D     		adds	r3, r7, #7
 700 028c 1A70     		strb	r2, [r3]
 119:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	GPIO_D.ODR_HIGH = 0;
 701              		.loc 2 119 0
 702 028e 0B4B     		ldr	r3, .L21
 703 0290 0022     		movs	r2, #0
 704 0292 5A75     		strb	r2, [r3, #21]
 120:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	GPIO_D.ODR_HIGH |= (0x1 << (4 + x));
 705              		.loc 2 120 0
 706 0294 0949     		ldr	r1, .L21
 707 0296 094B     		ldr	r3, .L21
 708 0298 5B7D     		ldrb	r3, [r3, #21]
 709 029a DBB2     		uxtb	r3, r3
 710 029c 5AB2     		sxtb	r2, r3
 711 029e FB1D     		adds	r3, r7, #7
 712 02a0 1B78     		ldrb	r3, [r3]
 713 02a2 0433     		adds	r3, r3, #4
 714 02a4 0120     		movs	r0, #1
 715 02a6 9840     		lsls	r0, r0, r3
 716 02a8 0300     		movs	r3, r0
 717 02aa 5BB2     		sxtb	r3, r3
 718 02ac 1343     		orrs	r3, r2
 719 02ae 5BB2     		sxtb	r3, r3
 720 02b0 DBB2     		uxtb	r3, r3
 721 02b2 4B75     		strb	r3, [r1, #21]
 121:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** }
 722              		.loc 2 121 0
 723 02b4 C046     		nop
 724 02b6 BD46     		mov	sp, r7
 725 02b8 02B0     		add	sp, sp, #8
 726              		@ sp needed
 727 02ba 80BD     		pop	{r7, pc}
 728              	.L22:
 729              		.align	2
 730              	.L21:
 731 02bc 000C0240 		.word	1073875968
 732              		.cfi_endproc
 733              	.LFE6:
 735              		.align	1
 736              		.global	readColumns
 737              		.syntax unified
 738              		.code	16
 739              		.thumb_func
 740              		.fpu softvfp
 742              	readColumns:
 743              	.LFB7:
 122:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 123:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** uint8 readColumns() {
 744              		.loc 2 123 0
 745              		.cfi_startproc
 746              		@ args = 0, pretend = 0, frame = 0
 747              		@ frame_needed = 1, uses_anonymous_args = 0
 748 02c0 80B5     		push	{r7, lr}
 749              		.cfi_def_cfa_offset 8
 750              		.cfi_offset 7, -8
 751              		.cfi_offset 14, -4
 752 02c2 00AF     		add	r7, sp, #0
 753              		.cfi_def_cfa_register 7
 124:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	return GPIO_D.IDR_HIGH;
 754              		.loc 2 124 0
 755 02c4 024B     		ldr	r3, .L25
 756 02c6 5B7C     		ldrb	r3, [r3, #17]
 757 02c8 DBB2     		uxtb	r3, r3
 125:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** }
 758              		.loc 2 125 0
 759 02ca 1800     		movs	r0, r3
 760 02cc BD46     		mov	sp, r7
 761              		@ sp needed
 762 02ce 80BD     		pop	{r7, pc}
 763              	.L26:
 764              		.align	2
 765              	.L25:
 766 02d0 000C0240 		.word	1073875968
 767              		.cfi_endproc
 768              	.LFE7:
 770              		.align	1
 771              		.global	barSteering
 772              		.syntax unified
 773              		.code	16
 774              		.thumb_func
 775              		.fpu softvfp
 777              	barSteering:
 778              	.LFB8:
 126:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 127:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 128:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 129:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** void barSteering(uint8 life) {
 779              		.loc 2 129 0
 780              		.cfi_startproc
 781              		@ args = 0, pretend = 0, frame = 24
 782              		@ frame_needed = 1, uses_anonymous_args = 0
 783 02d4 90B5     		push	{r4, r7, lr}
 784              		.cfi_def_cfa_offset 12
 785              		.cfi_offset 4, -12
 786              		.cfi_offset 7, -8
 787              		.cfi_offset 14, -4
 788 02d6 87B0     		sub	sp, sp, #28
 789              		.cfi_def_cfa_offset 40
 790 02d8 00AF     		add	r7, sp, #0
 791              		.cfi_def_cfa_register 7
 792 02da 0200     		movs	r2, r0
 793 02dc FB1D     		adds	r3, r7, #7
 794 02de 1A70     		strb	r2, [r3]
 130:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	out7seg(life);
 795              		.loc 2 130 0
 796 02e0 FB1D     		adds	r3, r7, #7
 797 02e2 1B78     		ldrb	r3, [r3]
 798 02e4 1800     		movs	r0, r3
 799 02e6 FFF7FEFF 		bl	out7seg
 131:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	
 132:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	ObjectPtr ballerBar = &bar;
 800              		.loc 2 132 0
 801 02ea 284B     		ldr	r3, .L35
 802 02ec 7B61     		str	r3, [r7, #20]
 133:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	ObjectPtr ballerBall = &ball;
 803              		.loc 2 133 0
 804 02ee 284B     		ldr	r3, .L35+4
 805 02f0 3B61     		str	r3, [r7, #16]
 134:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 135:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	init_app();
 806              		.loc 2 135 0
 807 02f2 FFF7FEFF 		bl	init_app
 136:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	graphic_initialize();
 808              		.loc 2 136 0
 809 02f6 FFF7FEFF 		bl	graphic_initialize
 137:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	
 138:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	
 139:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** /*
 140:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** #ifndef SIMULATOR
 141:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	graphic_clear_screen();
 142:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** #endif
 143:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** */
 144:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	ballerBall->set_speed(ballerBall, 2, 1);
 810              		.loc 2 144 0
 811 02fa 3B69     		ldr	r3, [r7, #16]
 812 02fc 5B69     		ldr	r3, [r3, #20]
 813 02fe 3869     		ldr	r0, [r7, #16]
 814 0300 0122     		movs	r2, #1
 815 0302 0221     		movs	r1, #2
 816 0304 9847     		blx	r3
 817              	.LVL4:
 145:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	ballerBar->set_speed(ballerBar, 0, 0);
 818              		.loc 2 145 0
 819 0306 7B69     		ldr	r3, [r7, #20]
 820 0308 5B69     		ldr	r3, [r3, #20]
 821 030a 7869     		ldr	r0, [r7, #20]
 822 030c 0022     		movs	r2, #0
 823 030e 0021     		movs	r1, #0
 824 0310 9847     		blx	r3
 825              	.LVL5:
 826              	.L32:
 827              	.LBB3:
 146:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	while(TRUE)
 147:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 148:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		
 149:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		if(sysTick_flag == 1){
 828              		.loc 2 149 0
 829 0312 204B     		ldr	r3, .L35+8
 830 0314 1B78     		ldrb	r3, [r3]
 831 0316 012B     		cmp	r3, #1
 832 0318 2CD0     		beq	.L34
 150:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		break;
 151:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		}
 152:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		uint8 input = keyb();
 833              		.loc 2 152 0
 834 031a 0F23     		movs	r3, #15
 835 031c FC18     		adds	r4, r7, r3
 836 031e FFF7FEFF 		bl	keyb
 837 0322 0300     		movs	r3, r0
 838 0324 2370     		strb	r3, [r4]
 153:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		// Up
 154:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		if (input == 1) {
 839              		.loc 2 154 0
 840 0326 0F23     		movs	r3, #15
 841 0328 FB18     		adds	r3, r7, r3
 842 032a 1B78     		ldrb	r3, [r3]
 843 032c 012B     		cmp	r3, #1
 844 032e 07D1     		bne	.L30
 155:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 			ballerBar->set_speed(ballerBar, 0, -SPEED);
 845              		.loc 2 155 0
 846 0330 7B69     		ldr	r3, [r7, #20]
 847 0332 5B69     		ldr	r3, [r3, #20]
 848 0334 0322     		movs	r2, #3
 849 0336 5242     		rsbs	r2, r2, #0
 850 0338 7869     		ldr	r0, [r7, #20]
 851 033a 0021     		movs	r1, #0
 852 033c 9847     		blx	r3
 853              	.LVL6:
 854 033e 0AE0     		b	.L31
 855              	.L30:
 156:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		}
 157:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		// Down
 158:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		else if (input == 5)
 856              		.loc 2 158 0
 857 0340 0F23     		movs	r3, #15
 858 0342 FB18     		adds	r3, r7, r3
 859 0344 1B78     		ldrb	r3, [r3]
 860 0346 052B     		cmp	r3, #5
 861 0348 05D1     		bne	.L31
 159:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		{
 160:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 			ballerBar->set_speed(ballerBar, 0, SPEED);
 862              		.loc 2 160 0
 863 034a 7B69     		ldr	r3, [r7, #20]
 864 034c 5B69     		ldr	r3, [r3, #20]
 865 034e 7869     		ldr	r0, [r7, #20]
 866 0350 0322     		movs	r2, #3
 867 0352 0021     		movs	r1, #0
 868 0354 9847     		blx	r3
 869              	.LVL7:
 870              	.L31:
 161:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		}
 162:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 163:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		ballerBall->move(ballerBall, ballerBar);
 871              		.loc 2 163 0
 872 0356 3B69     		ldr	r3, [r7, #16]
 873 0358 1B69     		ldr	r3, [r3, #16]
 874 035a 7969     		ldr	r1, [r7, #20]
 875 035c 3A69     		ldr	r2, [r7, #16]
 876 035e 1000     		movs	r0, r2
 877 0360 9847     		blx	r3
 878              	.LVL8:
 164:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 165:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		ballerBar->move(ballerBar,ballerBall);
 879              		.loc 2 165 0
 880 0362 7B69     		ldr	r3, [r7, #20]
 881 0364 1B69     		ldr	r3, [r3, #16]
 882 0366 3969     		ldr	r1, [r7, #16]
 883 0368 7A69     		ldr	r2, [r7, #20]
 884 036a 1000     		movs	r0, r2
 885 036c 9847     		blx	r3
 886              	.LVL9:
 166:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		delay_250ns(); // skall vara delay_milli(40);
 887              		.loc 2 166 0
 888 036e FFF7FEFF 		bl	delay_250ns
 889              	.LBE3:
 147:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		
 890              		.loc 2 147 0
 891 0372 CEE7     		b	.L32
 892              	.L34:
 893              	.LBB4:
 150:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		}
 894              		.loc 2 150 0
 895 0374 C046     		nop
 896              	.LBE4:
 167:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		
 168:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	}
 169:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	sysTick_flag = 0;
 897              		.loc 2 169 0
 898 0376 074B     		ldr	r3, .L35+8
 899 0378 0022     		movs	r2, #0
 900 037a 1A70     		strb	r2, [r3]
 170:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	ballerBall->posx = 64;
 901              		.loc 2 170 0
 902 037c 3B69     		ldr	r3, [r7, #16]
 903 037e 4022     		movs	r2, #64
 904 0380 9A71     		strb	r2, [r3, #6]
 171:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** }
 905              		.loc 2 171 0
 906 0382 C046     		nop
 907 0384 BD46     		mov	sp, r7
 908 0386 07B0     		add	sp, sp, #28
 909              		@ sp needed
 910 0388 90BD     		pop	{r4, r7, pc}
 911              	.L36:
 912 038a C046     		.align	2
 913              	.L35:
 914 038c 00000000 		.word	bar
 915 0390 00000000 		.word	ball
 916 0394 00000000 		.word	sysTick_flag
 917              		.cfi_endproc
 918              	.LFE8:
 920              		.align	1
 921              		.global	ballSteering
 922              		.syntax unified
 923              		.code	16
 924              		.thumb_func
 925              		.fpu softvfp
 927              	ballSteering:
 928              	.LFB9:
 172:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 173:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 174:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 175:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** ballSteering(void) {
 929              		.loc 2 175 0
 930              		.cfi_startproc
 931              		@ args = 0, pretend = 0, frame = 8
 932              		@ frame_needed = 1, uses_anonymous_args = 0
 933 0398 90B5     		push	{r4, r7, lr}
 934              		.cfi_def_cfa_offset 12
 935              		.cfi_offset 4, -12
 936              		.cfi_offset 7, -8
 937              		.cfi_offset 14, -4
 938 039a 83B0     		sub	sp, sp, #12
 939              		.cfi_def_cfa_offset 24
 940 039c 00AF     		add	r7, sp, #0
 941              		.cfi_def_cfa_register 7
 176:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	ObjectPtr ballerBall = &ball;
 942              		.loc 2 176 0
 943 039e 234B     		ldr	r3, .L43
 944 03a0 7B60     		str	r3, [r7, #4]
 177:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	init_app();
 945              		.loc 2 177 0
 946 03a2 FFF7FEFF 		bl	init_app
 178:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	graphic_initialize();
 947              		.loc 2 178 0
 948 03a6 FFF7FEFF 		bl	graphic_initialize
 179:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 180:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 181:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** /*
 182:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** #ifndef SIMULATOR
 183:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	graphic_clear_screen();
 184:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** #endif
 185:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** */
 186:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	ballerBall->set_speed(ballerBall, 0, 0);
 949              		.loc 2 186 0
 950 03aa 7B68     		ldr	r3, [r7, #4]
 951 03ac 5B69     		ldr	r3, [r3, #20]
 952 03ae 7868     		ldr	r0, [r7, #4]
 953 03b0 0022     		movs	r2, #0
 954 03b2 0021     		movs	r1, #0
 955 03b4 9847     		blx	r3
 956              	.LVL10:
 957              	.L42:
 958              	.LBB5:
 187:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	while(TRUE)
 188:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 189:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		uint8 input = keyb();
 959              		.loc 2 189 0
 960 03b6 FC1C     		adds	r4, r7, #3
 961 03b8 FFF7FEFF 		bl	keyb
 962 03bc 0300     		movs	r3, r0
 963 03be 2370     		strb	r3, [r4]
 190:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		// Up
 191:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		if (input == 1) {
 964              		.loc 2 191 0
 965 03c0 FB1C     		adds	r3, r7, #3
 966 03c2 1B78     		ldrb	r3, [r3]
 967 03c4 012B     		cmp	r3, #1
 968 03c6 07D1     		bne	.L38
 192:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 			ballerBall->set_speed(ballerBall, 0, -SPEED);
 969              		.loc 2 192 0
 970 03c8 7B68     		ldr	r3, [r7, #4]
 971 03ca 5B69     		ldr	r3, [r3, #20]
 972 03cc 0322     		movs	r2, #3
 973 03ce 5242     		rsbs	r2, r2, #0
 974 03d0 7868     		ldr	r0, [r7, #4]
 975 03d2 0021     		movs	r1, #0
 976 03d4 9847     		blx	r3
 977              	.LVL11:
 978 03d6 20E0     		b	.L39
 979              	.L38:
 193:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		}
 194:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		// Left
 195:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		else if (input == 4) 
 980              		.loc 2 195 0
 981 03d8 FB1C     		adds	r3, r7, #3
 982 03da 1B78     		ldrb	r3, [r3]
 983 03dc 042B     		cmp	r3, #4
 984 03de 07D1     		bne	.L40
 196:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		{
 197:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 			ballerBall->set_speed(ballerBall, -SPEED, 0);
 985              		.loc 2 197 0
 986 03e0 7B68     		ldr	r3, [r7, #4]
 987 03e2 5B69     		ldr	r3, [r3, #20]
 988 03e4 0322     		movs	r2, #3
 989 03e6 5142     		rsbs	r1, r2, #0
 990 03e8 7868     		ldr	r0, [r7, #4]
 991 03ea 0022     		movs	r2, #0
 992 03ec 9847     		blx	r3
 993              	.LVL12:
 994 03ee 14E0     		b	.L39
 995              	.L40:
 198:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		}
 199:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		// Down
 200:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		else if (input == 5)
 996              		.loc 2 200 0
 997 03f0 FB1C     		adds	r3, r7, #3
 998 03f2 1B78     		ldrb	r3, [r3]
 999 03f4 052B     		cmp	r3, #5
 1000 03f6 06D1     		bne	.L41
 201:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		{
 202:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 			ballerBall->set_speed(ballerBall, 0, SPEED);
 1001              		.loc 2 202 0
 1002 03f8 7B68     		ldr	r3, [r7, #4]
 1003 03fa 5B69     		ldr	r3, [r3, #20]
 1004 03fc 7868     		ldr	r0, [r7, #4]
 1005 03fe 0322     		movs	r2, #3
 1006 0400 0021     		movs	r1, #0
 1007 0402 9847     		blx	r3
 1008              	.LVL13:
 1009 0404 09E0     		b	.L39
 1010              	.L41:
 203:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		}
 204:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		// Right
 205:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		else if (input == 6)
 1011              		.loc 2 205 0
 1012 0406 FB1C     		adds	r3, r7, #3
 1013 0408 1B78     		ldrb	r3, [r3]
 1014 040a 062B     		cmp	r3, #6
 1015 040c 05D1     		bne	.L39
 206:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		{
 207:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 			ballerBall->set_speed(ballerBall, SPEED, 0);
 1016              		.loc 2 207 0
 1017 040e 7B68     		ldr	r3, [r7, #4]
 1018 0410 5B69     		ldr	r3, [r3, #20]
 1019 0412 7868     		ldr	r0, [r7, #4]
 1020 0414 0022     		movs	r2, #0
 1021 0416 0321     		movs	r1, #3
 1022 0418 9847     		blx	r3
 1023              	.LVL14:
 1024              	.L39:
 208:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		}
 209:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		
 210:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		ballerBall->move(ballerBall,ballerBall);
 1025              		.loc 2 210 0
 1026 041a 7B68     		ldr	r3, [r7, #4]
 1027 041c 1B69     		ldr	r3, [r3, #16]
 1028 041e 7968     		ldr	r1, [r7, #4]
 1029 0420 7A68     		ldr	r2, [r7, #4]
 1030 0422 1000     		movs	r0, r2
 1031 0424 9847     		blx	r3
 1032              	.LVL15:
 211:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		delay_250ns(); // skall vara delay_milli(40);
 1033              		.loc 2 211 0
 1034 0426 FFF7FEFF 		bl	delay_250ns
 1035              	.LBE5:
 188:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		uint8 input = keyb();
 1036              		.loc 2 188 0
 1037 042a C4E7     		b	.L42
 1038              	.L44:
 1039              		.align	2
 1040              	.L43:
 1041 042c 00000000 		.word	ball
 1042              		.cfi_endproc
 1043              	.LFE9:
 1045              		.align	1
 1046              		.global	keyb
 1047              		.syntax unified
 1048              		.code	16
 1049              		.thumb_func
 1050              		.fpu softvfp
 1052              	keyb:
 1053              	.LFB10:
 212:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	}
 213:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** }
 214:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 215:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** uint8 keyb( void ) {
 1054              		.loc 2 215 0
 1055              		.cfi_startproc
 1056              		@ args = 0, pretend = 0, frame = 8
 1057              		@ frame_needed = 1, uses_anonymous_args = 0
 1058 0430 90B5     		push	{r4, r7, lr}
 1059              		.cfi_def_cfa_offset 12
 1060              		.cfi_offset 4, -12
 1061              		.cfi_offset 7, -8
 1062              		.cfi_offset 14, -4
 1063 0432 83B0     		sub	sp, sp, #12
 1064              		.cfi_def_cfa_offset 24
 1065 0434 00AF     		add	r7, sp, #0
 1066              		.cfi_def_cfa_register 7
 216:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	uint8 activeKey = 0xFF;
 1067              		.loc 2 216 0
 1068 0436 3B1D     		adds	r3, r7, #4
 1069 0438 FF22     		movs	r2, #255
 1070 043a 1A70     		strb	r2, [r3]
 1071              	.LBB6:
 217:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	for (uint8 row = 0; row < 4; row++) {
 1072              		.loc 2 217 0
 1073 043c FB1D     		adds	r3, r7, #7
 1074 043e 0022     		movs	r2, #0
 1075 0440 1A70     		strb	r2, [r3]
 1076 0442 36E0     		b	.L46
 1077              	.L51:
 1078              	.LBB7:
 218:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		activateRow(row);
 1079              		.loc 2 218 0
 1080 0444 FB1D     		adds	r3, r7, #7
 1081 0446 1B78     		ldrb	r3, [r3]
 1082 0448 1800     		movs	r0, r3
 1083 044a FFF7FEFF 		bl	activateRow
 219:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		uint8 columnValue = readColumns();
 1084              		.loc 2 219 0
 1085 044e BC1D     		adds	r4, r7, #6
 1086 0450 FFF7FEFF 		bl	readColumns
 1087 0454 0300     		movs	r3, r0
 1088 0456 2370     		strb	r3, [r4]
 1089              	.LBB8:
 220:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		
 221:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		for (uint8 column = 0; column < 4; column++) {
 1090              		.loc 2 221 0
 1091 0458 7B1D     		adds	r3, r7, #5
 1092 045a 0022     		movs	r2, #0
 1093 045c 1A70     		strb	r2, [r3]
 1094 045e 1FE0     		b	.L47
 1095              	.L50:
 1096              	.LBB9:
 222:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 			uint8 activeColumn = (columnValue & 0x1);
 1097              		.loc 2 222 0
 1098 0460 FB1C     		adds	r3, r7, #3
 1099 0462 BA1D     		adds	r2, r7, #6
 1100 0464 1278     		ldrb	r2, [r2]
 1101 0466 0121     		movs	r1, #1
 1102 0468 0A40     		ands	r2, r1
 1103 046a 1A70     		strb	r2, [r3]
 223:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 			if (activeColumn) {
 1104              		.loc 2 223 0
 1105 046c FB1C     		adds	r3, r7, #3
 1106 046e 1B78     		ldrb	r3, [r3]
 1107 0470 002B     		cmp	r3, #0
 1108 0472 0BD0     		beq	.L48
 224:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 				activeKey = row * 4 + column;
 1109              		.loc 2 224 0
 1110 0474 FB1D     		adds	r3, r7, #7
 1111 0476 1B78     		ldrb	r3, [r3]
 1112 0478 9B00     		lsls	r3, r3, #2
 1113 047a D9B2     		uxtb	r1, r3
 1114 047c 3B1D     		adds	r3, r7, #4
 1115 047e 7A1D     		adds	r2, r7, #5
 1116 0480 1278     		ldrb	r2, [r2]
 1117 0482 8A18     		adds	r2, r1, r2
 1118 0484 1A70     		strb	r2, [r3]
 225:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 				return activeKey;
 1119              		.loc 2 225 0
 1120 0486 3B1D     		adds	r3, r7, #4
 1121 0488 1B78     		ldrb	r3, [r3]
 1122 048a 18E0     		b	.L49
 1123              	.L48:
 226:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 			}
 227:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 			columnValue >>= 0x1;
 1124              		.loc 2 227 0 discriminator 2
 1125 048c BB1D     		adds	r3, r7, #6
 1126 048e BA1D     		adds	r2, r7, #6
 1127 0490 1278     		ldrb	r2, [r2]
 1128 0492 5208     		lsrs	r2, r2, #1
 1129 0494 1A70     		strb	r2, [r3]
 1130              	.LBE9:
 221:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 			uint8 activeColumn = (columnValue & 0x1);
 1131              		.loc 2 221 0 discriminator 2
 1132 0496 7B1D     		adds	r3, r7, #5
 1133 0498 1A78     		ldrb	r2, [r3]
 1134 049a 7B1D     		adds	r3, r7, #5
 1135 049c 0132     		adds	r2, r2, #1
 1136 049e 1A70     		strb	r2, [r3]
 1137              	.L47:
 221:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 			uint8 activeColumn = (columnValue & 0x1);
 1138              		.loc 2 221 0 is_stmt 0 discriminator 1
 1139 04a0 7B1D     		adds	r3, r7, #5
 1140 04a2 1B78     		ldrb	r3, [r3]
 1141 04a4 032B     		cmp	r3, #3
 1142 04a6 DBD9     		bls	.L50
 1143              	.LBE8:
 1144              	.LBE7:
 217:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		activateRow(row);
 1145              		.loc 2 217 0 is_stmt 1 discriminator 2
 1146 04a8 FB1D     		adds	r3, r7, #7
 1147 04aa 1A78     		ldrb	r2, [r3]
 1148 04ac FB1D     		adds	r3, r7, #7
 1149 04ae 0132     		adds	r2, r2, #1
 1150 04b0 1A70     		strb	r2, [r3]
 1151              	.L46:
 217:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		activateRow(row);
 1152              		.loc 2 217 0 is_stmt 0 discriminator 1
 1153 04b2 FB1D     		adds	r3, r7, #7
 1154 04b4 1B78     		ldrb	r3, [r3]
 1155 04b6 032B     		cmp	r3, #3
 1156 04b8 C4D9     		bls	.L51
 1157              	.LBE6:
 228:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		}
 229:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	}
 230:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	return activeKey;
 1158              		.loc 2 230 0 is_stmt 1
 1159 04ba 3B1D     		adds	r3, r7, #4
 1160 04bc 1B78     		ldrb	r3, [r3]
 1161              	.L49:
 231:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** }
 1162              		.loc 2 231 0
 1163 04be 1800     		movs	r0, r3
 1164 04c0 BD46     		mov	sp, r7
 1165 04c2 03B0     		add	sp, sp, #12
 1166              		@ sp needed
 1167 04c4 90BD     		pop	{r4, r7, pc}
 1168              		.cfi_endproc
 1169              	.LFE10:
 1171              		.align	1
 1172              		.global	autopong
 1173              		.syntax unified
 1174              		.code	16
 1175              		.thumb_func
 1176              		.fpu softvfp
 1178              	autopong:
 1179              	.LFB11:
 232:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 233:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** void autopong(void)
 234:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** {
 1180              		.loc 2 234 0
 1181              		.cfi_startproc
 1182              		@ args = 0, pretend = 0, frame = 8
 1183              		@ frame_needed = 1, uses_anonymous_args = 0
 1184 04c6 80B5     		push	{r7, lr}
 1185              		.cfi_def_cfa_offset 8
 1186              		.cfi_offset 7, -8
 1187              		.cfi_offset 14, -4
 1188 04c8 82B0     		sub	sp, sp, #8
 1189              		.cfi_def_cfa_offset 16
 1190 04ca 00AF     		add	r7, sp, #0
 1191              		.cfi_def_cfa_register 7
 235:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	ObjectPtr ballerBall = &ball;
 1192              		.loc 2 235 0
 1193 04cc 0A4B     		ldr	r3, .L54
 1194 04ce 7B60     		str	r3, [r7, #4]
 236:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	init_app();
 1195              		.loc 2 236 0
 1196 04d0 FFF7FEFF 		bl	init_app
 237:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	graphic_initialize();
 1197              		.loc 2 237 0
 1198 04d4 FFF7FEFF 		bl	graphic_initialize
 238:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 239:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** /*
 240:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** #ifndef SIMULATOR
 241:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	graphic_clear_screen();
 242:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** #endif
 243:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** */
 244:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	ballerBall->set_speed(ballerBall, 4, 1);
 1199              		.loc 2 244 0
 1200 04d8 7B68     		ldr	r3, [r7, #4]
 1201 04da 5B69     		ldr	r3, [r3, #20]
 1202 04dc 7868     		ldr	r0, [r7, #4]
 1203 04de 0122     		movs	r2, #1
 1204 04e0 0421     		movs	r1, #4
 1205 04e2 9847     		blx	r3
 1206              	.LVL16:
 1207              	.L53:
 1208              	.LBB10:
 245:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 246:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	while(TRUE)
 247:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 248:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		ballerBall->move(ballerBall,ballerBall);
 1209              		.loc 2 248 0 discriminator 1
 1210 04e4 7B68     		ldr	r3, [r7, #4]
 1211 04e6 1B69     		ldr	r3, [r3, #16]
 1212 04e8 7968     		ldr	r1, [r7, #4]
 1213 04ea 7A68     		ldr	r2, [r7, #4]
 1214 04ec 1000     		movs	r0, r2
 1215 04ee 9847     		blx	r3
 1216              	.LVL17:
 249:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		delay_250ns(); // skall vara delay_milli(40);
 1217              		.loc 2 249 0 discriminator 1
 1218 04f0 FFF7FEFF 		bl	delay_250ns
 1219              	.LBE10:
 247:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		ballerBall->move(ballerBall,ballerBall);
 1220              		.loc 2 247 0 discriminator 1
 1221 04f4 F6E7     		b	.L53
 1222              	.L55:
 1223 04f6 C046     		.align	2
 1224              	.L54:
 1225 04f8 00000000 		.word	ball
 1226              		.cfi_endproc
 1227              	.LFE11:
 1229              		.align	1
 1230              		.global	drawTest
 1231              		.syntax unified
 1232              		.code	16
 1233              		.thumb_func
 1234              		.fpu softvfp
 1236              	drawTest:
 1237              	.LFB12:
 250:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	}
 251:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** }
 252:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 253:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** void drawTest(void)
 254:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** {
 1238              		.loc 2 254 0
 1239              		.cfi_startproc
 1240              		@ args = 0, pretend = 0, frame = 8
 1241              		@ frame_needed = 1, uses_anonymous_args = 0
 1242 04fc 80B5     		push	{r7, lr}
 1243              		.cfi_def_cfa_offset 8
 1244              		.cfi_offset 7, -8
 1245              		.cfi_offset 14, -4
 1246 04fe 82B0     		sub	sp, sp, #8
 1247              		.cfi_def_cfa_offset 16
 1248 0500 00AF     		add	r7, sp, #0
 1249              		.cfi_def_cfa_register 7
 255:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	uint32 i;
 256:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	init_app();
 1250              		.loc 2 256 0
 1251 0502 FFF7FEFF 		bl	init_app
 257:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	graphic_initialize();
 1252              		.loc 2 257 0
 1253 0506 FFF7FEFF 		bl	graphic_initialize
 258:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 259:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** #ifndef SIMULATOR
 260:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	graphic_clear_screen();
 1254              		.loc 2 260 0
 1255 050a FFF7FEFF 		bl	graphic_clear_screen
 261:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** #endif
 262:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 263:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	for (i = 0; i < 128; i++)
 1256              		.loc 2 263 0
 1257 050e 0023     		movs	r3, #0
 1258 0510 7B60     		str	r3, [r7, #4]
 1259 0512 09E0     		b	.L57
 1260              	.L58:
 264:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 265:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		pixel(i, 10, 1);
 1261              		.loc 2 265 0 discriminator 3
 1262 0514 7B68     		ldr	r3, [r7, #4]
 1263 0516 DBB2     		uxtb	r3, r3
 1264 0518 0122     		movs	r2, #1
 1265 051a 0A21     		movs	r1, #10
 1266 051c 1800     		movs	r0, r3
 1267 051e FFF7FEFF 		bl	pixel
 263:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 1268              		.loc 2 263 0 discriminator 3
 1269 0522 7B68     		ldr	r3, [r7, #4]
 1270 0524 0133     		adds	r3, r3, #1
 1271 0526 7B60     		str	r3, [r7, #4]
 1272              	.L57:
 263:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 1273              		.loc 2 263 0 is_stmt 0 discriminator 1
 1274 0528 7B68     		ldr	r3, [r7, #4]
 1275 052a 7F2B     		cmp	r3, #127
 1276 052c F2D9     		bls	.L58
 266:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	}
 267:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	for (i = 0; i < 64; i++)
 1277              		.loc 2 267 0 is_stmt 1
 1278 052e 0023     		movs	r3, #0
 1279 0530 7B60     		str	r3, [r7, #4]
 1280 0532 09E0     		b	.L59
 1281              	.L60:
 268:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 269:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		pixel(10, i, 1);
 1282              		.loc 2 269 0 discriminator 3
 1283 0534 7B68     		ldr	r3, [r7, #4]
 1284 0536 DBB2     		uxtb	r3, r3
 1285 0538 0122     		movs	r2, #1
 1286 053a 1900     		movs	r1, r3
 1287 053c 0A20     		movs	r0, #10
 1288 053e FFF7FEFF 		bl	pixel
 267:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 1289              		.loc 2 267 0 discriminator 3
 1290 0542 7B68     		ldr	r3, [r7, #4]
 1291 0544 0133     		adds	r3, r3, #1
 1292 0546 7B60     		str	r3, [r7, #4]
 1293              	.L59:
 267:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 1294              		.loc 2 267 0 is_stmt 0 discriminator 1
 1295 0548 7B68     		ldr	r3, [r7, #4]
 1296 054a 3F2B     		cmp	r3, #63
 1297 054c F2D9     		bls	.L60
 270:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	}
 271:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 272:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	delay_milli(1);
 1298              		.loc 2 272 0 is_stmt 1
 1299 054e 0120     		movs	r0, #1
 1300 0550 FFF7FEFF 		bl	delay_milli
 273:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 274:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	for (i = 0; i < 128; i++)
 1301              		.loc 2 274 0
 1302 0554 0023     		movs	r3, #0
 1303 0556 7B60     		str	r3, [r7, #4]
 1304 0558 09E0     		b	.L61
 1305              	.L62:
 275:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 276:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		pixel(i, 10, 0);
 1306              		.loc 2 276 0 discriminator 3
 1307 055a 7B68     		ldr	r3, [r7, #4]
 1308 055c DBB2     		uxtb	r3, r3
 1309 055e 0022     		movs	r2, #0
 1310 0560 0A21     		movs	r1, #10
 1311 0562 1800     		movs	r0, r3
 1312 0564 FFF7FEFF 		bl	pixel
 274:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 1313              		.loc 2 274 0 discriminator 3
 1314 0568 7B68     		ldr	r3, [r7, #4]
 1315 056a 0133     		adds	r3, r3, #1
 1316 056c 7B60     		str	r3, [r7, #4]
 1317              	.L61:
 274:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 1318              		.loc 2 274 0 is_stmt 0 discriminator 1
 1319 056e 7B68     		ldr	r3, [r7, #4]
 1320 0570 7F2B     		cmp	r3, #127
 1321 0572 F2D9     		bls	.L62
 277:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	}
 278:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	for (i = 0; i < 64; i++)
 1322              		.loc 2 278 0 is_stmt 1
 1323 0574 0023     		movs	r3, #0
 1324 0576 7B60     		str	r3, [r7, #4]
 1325 0578 09E0     		b	.L63
 1326              	.L64:
 279:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 280:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		pixel(10, i, 0);
 1327              		.loc 2 280 0 discriminator 3
 1328 057a 7B68     		ldr	r3, [r7, #4]
 1329 057c DBB2     		uxtb	r3, r3
 1330 057e 0022     		movs	r2, #0
 1331 0580 1900     		movs	r1, r3
 1332 0582 0A20     		movs	r0, #10
 1333 0584 FFF7FEFF 		bl	pixel
 278:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 1334              		.loc 2 278 0 discriminator 3
 1335 0588 7B68     		ldr	r3, [r7, #4]
 1336 058a 0133     		adds	r3, r3, #1
 1337 058c 7B60     		str	r3, [r7, #4]
 1338              	.L63:
 278:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 1339              		.loc 2 278 0 is_stmt 0 discriminator 1
 1340 058e 7B68     		ldr	r3, [r7, #4]
 1341 0590 3F2B     		cmp	r3, #63
 1342 0592 F2D9     		bls	.L64
 281:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	}
 282:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** }
 1343              		.loc 2 282 0 is_stmt 1
 1344 0594 C046     		nop
 1345 0596 BD46     		mov	sp, r7
 1346 0598 02B0     		add	sp, sp, #8
 1347              		@ sp needed
 1348 059a 80BD     		pop	{r7, pc}
 1349              		.cfi_endproc
 1350              	.LFE12:
 1352              		.align	1
 1353              		.global	clear_object
 1354              		.syntax unified
 1355              		.code	16
 1356              		.thumb_func
 1357              		.fpu softvfp
 1359              	clear_object:
 1360              	.LFB13:
 283:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 284:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** void clear_object (ObjectPtr obj)
 285:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** {	
 1361              		.loc 2 285 0
 1362              		.cfi_startproc
 1363              		@ args = 0, pretend = 0, frame = 24
 1364              		@ frame_needed = 1, uses_anonymous_args = 0
 1365 059c 80B5     		push	{r7, lr}
 1366              		.cfi_def_cfa_offset 8
 1367              		.cfi_offset 7, -8
 1368              		.cfi_offset 14, -4
 1369 059e 86B0     		sub	sp, sp, #24
 1370              		.cfi_def_cfa_offset 32
 1371 05a0 00AF     		add	r7, sp, #0
 1372              		.cfi_def_cfa_register 7
 1373 05a2 7860     		str	r0, [r7, #4]
 286:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	GeometryPtr objectGeometry = obj->geo;
 1374              		.loc 2 286 0
 1375 05a4 7B68     		ldr	r3, [r7, #4]
 1376 05a6 1B68     		ldr	r3, [r3]
 1377 05a8 3B61     		str	r3, [r7, #16]
 287:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	uint8 dimensionSize = objectGeometry->numpoints;
 1378              		.loc 2 287 0
 1379 05aa 0F23     		movs	r3, #15
 1380 05ac FB18     		adds	r3, r7, r3
 1381 05ae 3A69     		ldr	r2, [r7, #16]
 1382 05b0 1278     		ldrb	r2, [r2]
 1383 05b2 1A70     		strb	r2, [r3]
 1384              	.LBB11:
 288:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	
 289:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	for(int i = 0; i < dimensionSize; i++)
 1385              		.loc 2 289 0
 1386 05b4 0023     		movs	r3, #0
 1387 05b6 7B61     		str	r3, [r7, #20]
 1388 05b8 25E0     		b	.L66
 1389              	.L67:
 1390              	.LBB12:
 290:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 291:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		Point objectPixel = objectGeometry->px[i];
 1391              		.loc 2 291 0 discriminator 3
 1392 05ba 0C23     		movs	r3, #12
 1393 05bc F818     		adds	r0, r7, r3
 1394 05be 3A69     		ldr	r2, [r7, #16]
 1395 05c0 7B69     		ldr	r3, [r7, #20]
 1396 05c2 5B00     		lsls	r3, r3, #1
 1397 05c4 0321     		movs	r1, #3
 1398 05c6 D318     		adds	r3, r2, r3
 1399 05c8 5B18     		adds	r3, r3, r1
 1400 05ca 1900     		movs	r1, r3
 1401 05cc 0223     		movs	r3, #2
 1402 05ce 1A00     		movs	r2, r3
 1403 05d0 FFF7FEFF 		bl	memcpy
 292:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		pixel(obj->posx + objectPixel.x, obj->posy + objectPixel.y, 0);
 1404              		.loc 2 292 0 discriminator 3
 1405 05d4 7B68     		ldr	r3, [r7, #4]
 1406 05d6 9B79     		ldrb	r3, [r3, #6]
 1407 05d8 5BB2     		sxtb	r3, r3
 1408 05da DAB2     		uxtb	r2, r3
 1409 05dc 0C23     		movs	r3, #12
 1410 05de FB18     		adds	r3, r7, r3
 1411 05e0 1B78     		ldrb	r3, [r3]
 1412 05e2 D318     		adds	r3, r2, r3
 1413 05e4 D8B2     		uxtb	r0, r3
 1414 05e6 7B68     		ldr	r3, [r7, #4]
 1415 05e8 DB79     		ldrb	r3, [r3, #7]
 1416 05ea 5BB2     		sxtb	r3, r3
 1417 05ec DAB2     		uxtb	r2, r3
 1418 05ee 0C23     		movs	r3, #12
 1419 05f0 FB18     		adds	r3, r7, r3
 1420 05f2 5B78     		ldrb	r3, [r3, #1]
 1421 05f4 D318     		adds	r3, r2, r3
 1422 05f6 DBB2     		uxtb	r3, r3
 1423 05f8 0022     		movs	r2, #0
 1424 05fa 1900     		movs	r1, r3
 1425 05fc FFF7FEFF 		bl	pixel
 1426              	.LBE12:
 289:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 1427              		.loc 2 289 0 discriminator 3
 1428 0600 7B69     		ldr	r3, [r7, #20]
 1429 0602 0133     		adds	r3, r3, #1
 1430 0604 7B61     		str	r3, [r7, #20]
 1431              	.L66:
 289:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 1432              		.loc 2 289 0 is_stmt 0 discriminator 1
 1433 0606 0F23     		movs	r3, #15
 1434 0608 FB18     		adds	r3, r7, r3
 1435 060a 1A78     		ldrb	r2, [r3]
 1436 060c 7B69     		ldr	r3, [r7, #20]
 1437 060e 9A42     		cmp	r2, r3
 1438 0610 D3DC     		bgt	.L67
 1439              	.LBE11:
 293:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	}
 294:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** }
 1440              		.loc 2 294 0 is_stmt 1
 1441 0612 C046     		nop
 1442 0614 BD46     		mov	sp, r7
 1443 0616 06B0     		add	sp, sp, #24
 1444              		@ sp needed
 1445 0618 80BD     		pop	{r7, pc}
 1446              		.cfi_endproc
 1447              	.LFE13:
 1449              		.align	1
 1450              		.global	draw_object
 1451              		.syntax unified
 1452              		.code	16
 1453              		.thumb_func
 1454              		.fpu softvfp
 1456              	draw_object:
 1457              	.LFB14:
 295:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 
 296:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** void draw_object (ObjectPtr obj)
 297:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** {	
 1458              		.loc 2 297 0
 1459              		.cfi_startproc
 1460              		@ args = 0, pretend = 0, frame = 24
 1461              		@ frame_needed = 1, uses_anonymous_args = 0
 1462 061a 80B5     		push	{r7, lr}
 1463              		.cfi_def_cfa_offset 8
 1464              		.cfi_offset 7, -8
 1465              		.cfi_offset 14, -4
 1466 061c 86B0     		sub	sp, sp, #24
 1467              		.cfi_def_cfa_offset 32
 1468 061e 00AF     		add	r7, sp, #0
 1469              		.cfi_def_cfa_register 7
 1470 0620 7860     		str	r0, [r7, #4]
 298:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	GeometryPtr objectGeometry = obj->geo;
 1471              		.loc 2 298 0
 1472 0622 7B68     		ldr	r3, [r7, #4]
 1473 0624 1B68     		ldr	r3, [r3]
 1474 0626 3B61     		str	r3, [r7, #16]
 299:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	uint8 dimensionSize = objectGeometry->numpoints;
 1475              		.loc 2 299 0
 1476 0628 0F23     		movs	r3, #15
 1477 062a FB18     		adds	r3, r7, r3
 1478 062c 3A69     		ldr	r2, [r7, #16]
 1479 062e 1278     		ldrb	r2, [r2]
 1480 0630 1A70     		strb	r2, [r3]
 1481              	.LBB13:
 300:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	
 301:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	for(int i = 0; i < dimensionSize; i++)
 1482              		.loc 2 301 0
 1483 0632 0023     		movs	r3, #0
 1484 0634 7B61     		str	r3, [r7, #20]
 1485 0636 25E0     		b	.L69
 1486              	.L70:
 1487              	.LBB14:
 302:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 303:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		Point objectPixel = objectGeometry->px[i];
 1488              		.loc 2 303 0 discriminator 3
 1489 0638 0C23     		movs	r3, #12
 1490 063a F818     		adds	r0, r7, r3
 1491 063c 3A69     		ldr	r2, [r7, #16]
 1492 063e 7B69     		ldr	r3, [r7, #20]
 1493 0640 5B00     		lsls	r3, r3, #1
 1494 0642 0321     		movs	r1, #3
 1495 0644 D318     		adds	r3, r2, r3
 1496 0646 5B18     		adds	r3, r3, r1
 1497 0648 1900     		movs	r1, r3
 1498 064a 0223     		movs	r3, #2
 1499 064c 1A00     		movs	r2, r3
 1500 064e FFF7FEFF 		bl	memcpy
 304:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		pixel(obj->posx + objectPixel.x, obj->posy + objectPixel.y, 1);
 1501              		.loc 2 304 0 discriminator 3
 1502 0652 7B68     		ldr	r3, [r7, #4]
 1503 0654 9B79     		ldrb	r3, [r3, #6]
 1504 0656 5BB2     		sxtb	r3, r3
 1505 0658 DAB2     		uxtb	r2, r3
 1506 065a 0C23     		movs	r3, #12
 1507 065c FB18     		adds	r3, r7, r3
 1508 065e 1B78     		ldrb	r3, [r3]
 1509 0660 D318     		adds	r3, r2, r3
 1510 0662 D8B2     		uxtb	r0, r3
 1511 0664 7B68     		ldr	r3, [r7, #4]
 1512 0666 DB79     		ldrb	r3, [r3, #7]
 1513 0668 5BB2     		sxtb	r3, r3
 1514 066a DAB2     		uxtb	r2, r3
 1515 066c 0C23     		movs	r3, #12
 1516 066e FB18     		adds	r3, r7, r3
 1517 0670 5B78     		ldrb	r3, [r3, #1]
 1518 0672 D318     		adds	r3, r2, r3
 1519 0674 DBB2     		uxtb	r3, r3
 1520 0676 0122     		movs	r2, #1
 1521 0678 1900     		movs	r1, r3
 1522 067a FFF7FEFF 		bl	pixel
 1523              	.LBE14:
 301:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 1524              		.loc 2 301 0 discriminator 3
 1525 067e 7B69     		ldr	r3, [r7, #20]
 1526 0680 0133     		adds	r3, r3, #1
 1527 0682 7B61     		str	r3, [r7, #20]
 1528              	.L69:
 301:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	{
 1529              		.loc 2 301 0 is_stmt 0 discriminator 1
 1530 0684 0F23     		movs	r3, #15
 1531 0686 FB18     		adds	r3, r7, r3
 1532 0688 1A78     		ldrb	r2, [r3]
 1533 068a 7B69     		ldr	r3, [r7, #20]
 1534 068c 9A42     		cmp	r2, r3
 1535 068e D3DC     		bgt	.L70
 1536              	.LBE13:
 305:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	}
 306:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** }
 1537              		.loc 2 306 0 is_stmt 1
 1538 0690 C046     		nop
 1539 0692 BD46     		mov	sp, r7
 1540 0694 06B0     		add	sp, sp, #24
 1541              		@ sp needed
 1542 0696 80BD     		pop	{r7, pc}
 1543              		.cfi_endproc
 1544              	.LFE14:
 1546              		.align	1
 1547              		.global	out7seg
 1548              		.syntax unified
 1549              		.code	16
 1550              		.thumb_func
 1551              		.fpu softvfp
 1553              	out7seg:
 1554              	.LFB15:
 307:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** void out7seg(unsigned char keyValue) {
 1555              		.loc 2 307 0
 1556              		.cfi_startproc
 1557              		@ args = 0, pretend = 0, frame = 8
 1558              		@ frame_needed = 1, uses_anonymous_args = 0
 1559 0698 80B5     		push	{r7, lr}
 1560              		.cfi_def_cfa_offset 8
 1561              		.cfi_offset 7, -8
 1562              		.cfi_offset 14, -4
 1563 069a 82B0     		sub	sp, sp, #8
 1564              		.cfi_def_cfa_offset 16
 1565 069c 00AF     		add	r7, sp, #0
 1566              		.cfi_def_cfa_register 7
 1567 069e 0200     		movs	r2, r0
 1568 06a0 FB1D     		adds	r3, r7, #7
 1569 06a2 1A70     		strb	r2, [r3]
 308:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	static uint8_c sevenSegmentCodes[] = {
 309:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		0x3F, 0x06, 0x5B, 0x4F
 310:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	};
 311:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	
 312:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	if (keyValue < 4 && keyValue >= 0) {
 1570              		.loc 2 312 0
 1571 06a4 FB1D     		adds	r3, r7, #7
 1572 06a6 1B78     		ldrb	r3, [r3]
 1573 06a8 032B     		cmp	r3, #3
 1574 06aa 07D8     		bhi	.L72
 313:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		GPIO_D.ODR = sevenSegmentCodes[keyValue];
 1575              		.loc 2 313 0
 1576 06ac 0749     		ldr	r1, .L75
 1577 06ae FB1D     		adds	r3, r7, #7
 1578 06b0 1B78     		ldrb	r3, [r3]
 1579 06b2 074A     		ldr	r2, .L75+4
 1580 06b4 D35C     		ldrb	r3, [r2, r3]
 1581 06b6 9BB2     		uxth	r3, r3
 1582 06b8 8B82     		strh	r3, [r1, #20]
 314:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	} else {
 315:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		GPIO_D.ODR = 0x00;
 316:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 	}
 317:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** }...
 1583              		.loc 2 317 0
 1584 06ba 02E0     		b	.L74
 1585              	.L72:
 315:C:/Users/Murk/Documents/Moplaborationer/lab5\startup.c **** 		GPIO_D.ODR = 0x00;
 1586              		.loc 2 315 0
 1587 06bc 034B     		ldr	r3, .L75
 1588 06be 0022     		movs	r2, #0
 1589 06c0 9A82     		strh	r2, [r3, #20]
 1590              	.L74:
 1591              		.loc 2 317 0
 1592 06c2 C046     		nop
 1593 06c4 BD46     		mov	sp, r7
 1594 06c6 02B0     		add	sp, sp, #8
 1595              		@ sp needed
 1596 06c8 80BD     		pop	{r7, pc}
 1597              	.L76:
 1598 06ca C046     		.align	2
 1599              	.L75:
 1600 06cc 000C0240 		.word	1073875968
 1601 06d0 A8000000 		.word	sevenSegmentCodes.4211
 1602              		.cfi_endproc
 1603              	.LFE15:
 1605              		.section	.rodata
 1606 00a7 00       		.align	2
 1609              	sevenSegmentCodes.4211:
 1610 00a8 3F       		.byte	63
 1611 00a9 06       		.byte	6
 1612 00aa 5B       		.byte	91
 1613 00ab 4F       		.byte	79
 1614              		.text
 1615              	.Letext0:
 1616              		.file 3 "C:/Users/Murk/Documents/Moplaborationer/lab5/types.h"
 1617              		.file 4 "C:/Users/Murk/Documents/Moplaborationer/lab5/gpio.h"
 1618              		.file 5 "C:/Users/Murk/Documents/Moplaborationer/lab5/geometry.h"
