/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;
static const char *ng2 = "D:/unmc degree/year 4/sem2/hdl/project/temp_sensor/bcd.vhd";

unsigned char ieee_p_3620187407_sub_2546454082_3965413181(char *, char *, char *, int );
unsigned char ieee_p_3620187407_sub_3908131327_3965413181(char *, char *, char *, int );
char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );


char *work_a_3807574445_3212880686_sub_894001845_3057020925(char *t1, char *t2, char *t3)
{
    char t4[248];
    char t5[24];
    char t6[16];
    char t11[16];
    char t16[16];
    char t22[16];
    char t28[24];
    char t44[16];
    char t47[16];
    char t51[16];
    char *t0;
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    char *t12;
    int t13;
    char *t14;
    char *t15;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t23;
    char *t24;
    int t25;
    char *t26;
    char *t27;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned char t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    int t45;
    unsigned int t46;
    int t48;
    unsigned int t49;
    unsigned int t50;
    int t52;
    unsigned int t53;
    int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    int t59;

LAB0:    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 11;
    t8 = (t7 + 4U);
    *((int *)t8) = 0;
    t8 = (t7 + 8U);
    *((int *)t8) = -1;
    t9 = (0 - 11);
    t10 = (t9 * -1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t8 = (t11 + 0U);
    t12 = (t8 + 0U);
    *((int *)t12) = 11;
    t12 = (t8 + 4U);
    *((int *)t12) = 0;
    t12 = (t8 + 8U);
    *((int *)t12) = -1;
    t13 = (0 - 11);
    t10 = (t13 * -1);
    t10 = (t10 + 1);
    t12 = (t8 + 12U);
    *((unsigned int *)t12) = t10;
    t12 = (t4 + 4U);
    t14 = ((IEEE_P_2592010699) + 4024);
    t15 = (t12 + 88U);
    *((char **)t15) = t14;
    t17 = (t12 + 56U);
    *((char **)t17) = t16;
    xsi_type_set_default_value(t14, t16, t11);
    t18 = (t12 + 64U);
    *((char **)t18) = t11;
    t19 = (t12 + 80U);
    *((unsigned int *)t19) = 12U;
    t20 = xsi_get_transient_memory(24U);
    memset(t20, 0, 24U);
    t21 = t20;
    memset(t21, (unsigned char)2, 24U);
    t23 = (t22 + 0U);
    t24 = (t23 + 0U);
    *((int *)t24) = 23;
    t24 = (t23 + 4U);
    *((int *)t24) = 0;
    t24 = (t23 + 8U);
    *((int *)t24) = -1;
    t25 = (0 - 23);
    t10 = (t25 * -1);
    t10 = (t10 + 1);
    t24 = (t23 + 12U);
    *((unsigned int *)t24) = t10;
    t24 = (t4 + 124U);
    t26 = ((IEEE_P_2592010699) + 4024);
    t27 = (t24 + 88U);
    *((char **)t27) = t26;
    t29 = (t24 + 56U);
    *((char **)t29) = t28;
    memcpy(t28, t20, 24U);
    t30 = (t24 + 64U);
    *((char **)t30) = t22;
    t31 = (t24 + 80U);
    *((unsigned int *)t31) = 24U;
    t32 = (t5 + 4U);
    t33 = (t3 != 0);
    if (t33 == 1)
        goto LAB3;

LAB2:    t34 = (t5 + 12U);
    *((char **)t34) = t6;
    t35 = (t22 + 12U);
    t10 = *((unsigned int *)t35);
    t10 = (t10 * 1U);
    t36 = xsi_get_transient_memory(t10);
    memset(t36, 0, t10);
    t37 = t36;
    memset(t37, (unsigned char)2, t10);
    t38 = (t24 + 56U);
    t39 = *((char **)t38);
    t38 = (t39 + 0);
    t40 = (t22 + 12U);
    t41 = *((unsigned int *)t40);
    t41 = (t41 * 1U);
    memcpy(t38, t36, t41);
    t7 = (t12 + 56U);
    t8 = *((char **)t7);
    t7 = (t11 + 0U);
    t9 = *((int *)t7);
    t10 = (t9 - 11);
    t41 = (t10 * 1U);
    t42 = (0 + t41);
    t14 = (t8 + t42);
    t15 = (t6 + 12U);
    t43 = *((unsigned int *)t15);
    t43 = (t43 * 1U);
    memcpy(t14, t3, t43);
    t7 = (t11 + 12U);
    t10 = *((unsigned int *)t7);
    t9 = 1;
    t13 = t10;

LAB4:    if (t9 <= t13)
        goto LAB5;

LAB7:    t7 = (t24 + 56U);
    t8 = *((char **)t7);
    t7 = (t22 + 12U);
    t10 = *((unsigned int *)t7);
    t10 = (t10 * 1U);
    t0 = xsi_get_transient_memory(t10);
    memcpy(t0, t8, t10);
    t14 = (t22 + 0U);
    t9 = *((int *)t14);
    t15 = (t22 + 4U);
    t13 = *((int *)t15);
    t17 = (t22 + 8U);
    t25 = *((int *)t17);
    t18 = (t2 + 0U);
    t19 = (t18 + 0U);
    *((int *)t19) = t9;
    t19 = (t18 + 4U);
    *((int *)t19) = t13;
    t19 = (t18 + 8U);
    *((int *)t19) = t25;
    t45 = (t13 - t9);
    t41 = (t45 * t25);
    t41 = (t41 + 1);
    t19 = (t18 + 12U);
    *((unsigned int *)t19) = t41;

LAB1:    return t0;
LAB3:    *((char **)t32) = t3;
    goto LAB2;

LAB5:    t8 = (t24 + 56U);
    t14 = *((char **)t8);
    t8 = (t22 + 0U);
    t25 = *((int *)t8);
    t41 = (t25 - 3);
    t42 = (t41 * 1U);
    t43 = (0 + t42);
    t15 = (t14 + t43);
    t17 = (t44 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 3;
    t18 = (t17 + 4U);
    *((int *)t18) = 0;
    t18 = (t17 + 8U);
    *((int *)t18) = -1;
    t45 = (0 - 3);
    t46 = (t45 * -1);
    t46 = (t46 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t46;
    t33 = ieee_p_3620187407_sub_3908131327_3965413181(IEEE_P_3620187407, t15, t44, 1);
    if (t33 != 0)
        goto LAB8;

LAB10:
LAB9:    t7 = (t24 + 56U);
    t8 = *((char **)t7);
    t7 = (t22 + 0U);
    t25 = *((int *)t7);
    t10 = (t25 - 7);
    t41 = (t10 * 1U);
    t42 = (0 + t41);
    t14 = (t8 + t42);
    t15 = (t44 + 0U);
    t17 = (t15 + 0U);
    *((int *)t17) = 7;
    t17 = (t15 + 4U);
    *((int *)t17) = 4;
    t17 = (t15 + 8U);
    *((int *)t17) = -1;
    t45 = (4 - 7);
    t43 = (t45 * -1);
    t43 = (t43 + 1);
    t17 = (t15 + 12U);
    *((unsigned int *)t17) = t43;
    t33 = ieee_p_3620187407_sub_3908131327_3965413181(IEEE_P_3620187407, t14, t44, 1);
    if (t33 != 0)
        goto LAB11;

LAB13:
LAB12:    t7 = (t24 + 56U);
    t8 = *((char **)t7);
    t7 = (t22 + 0U);
    t25 = *((int *)t7);
    t10 = (t25 - 11);
    t41 = (t10 * 1U);
    t42 = (0 + t41);
    t14 = (t8 + t42);
    t15 = (t44 + 0U);
    t17 = (t15 + 0U);
    *((int *)t17) = 11;
    t17 = (t15 + 4U);
    *((int *)t17) = 8;
    t17 = (t15 + 8U);
    *((int *)t17) = -1;
    t45 = (8 - 11);
    t43 = (t45 * -1);
    t43 = (t43 + 1);
    t17 = (t15 + 12U);
    *((unsigned int *)t17) = t43;
    t33 = ieee_p_3620187407_sub_2546454082_3965413181(IEEE_P_3620187407, t14, t44, 4);
    if (t33 != 0)
        goto LAB14;

LAB16:
LAB15:    t7 = (t24 + 56U);
    t8 = *((char **)t7);
    t7 = (t22 + 0U);
    t25 = *((int *)t7);
    t10 = (t25 - 15);
    t41 = (t10 * 1U);
    t42 = (0 + t41);
    t14 = (t8 + t42);
    t15 = (t44 + 0U);
    t17 = (t15 + 0U);
    *((int *)t17) = 15;
    t17 = (t15 + 4U);
    *((int *)t17) = 12;
    t17 = (t15 + 8U);
    *((int *)t17) = -1;
    t45 = (12 - 15);
    t43 = (t45 * -1);
    t43 = (t43 + 1);
    t17 = (t15 + 12U);
    *((unsigned int *)t17) = t43;
    t33 = ieee_p_3620187407_sub_2546454082_3965413181(IEEE_P_3620187407, t14, t44, 4);
    if (t33 != 0)
        goto LAB17;

LAB19:
LAB18:    t7 = (t24 + 56U);
    t8 = *((char **)t7);
    t7 = (t22 + 0U);
    t25 = *((int *)t7);
    t10 = (t25 - 19);
    t41 = (t10 * 1U);
    t42 = (0 + t41);
    t14 = (t8 + t42);
    t15 = (t44 + 0U);
    t17 = (t15 + 0U);
    *((int *)t17) = 19;
    t17 = (t15 + 4U);
    *((int *)t17) = 16;
    t17 = (t15 + 8U);
    *((int *)t17) = -1;
    t45 = (16 - 19);
    t43 = (t45 * -1);
    t43 = (t43 + 1);
    t17 = (t15 + 12U);
    *((unsigned int *)t17) = t43;
    t33 = ieee_p_3620187407_sub_2546454082_3965413181(IEEE_P_3620187407, t14, t44, 4);
    if (t33 != 0)
        goto LAB20;

LAB22:
LAB21:    t7 = (t24 + 56U);
    t8 = *((char **)t7);
    t7 = (t22 + 0U);
    t25 = *((int *)t7);
    t10 = (t25 - 22);
    t41 = (t10 * 1U);
    t42 = (0 + t41);
    t14 = (t8 + t42);
    t15 = (t12 + 56U);
    t17 = *((char **)t15);
    t15 = (t11 + 0U);
    t45 = *((int *)t15);
    t18 = (t11 + 8U);
    t48 = *((int *)t18);
    t52 = (11 - t45);
    t43 = (t52 * t48);
    t46 = (1U * t43);
    t49 = (0 + t46);
    t19 = (t17 + t49);
    t33 = *((unsigned char *)t19);
    t21 = ((IEEE_P_2592010699) + 4024);
    t23 = (t47 + 0U);
    t26 = (t23 + 0U);
    *((int *)t26) = 22;
    t26 = (t23 + 4U);
    *((int *)t26) = 0;
    t26 = (t23 + 8U);
    *((int *)t26) = -1;
    t54 = (0 - 22);
    t50 = (t54 * -1);
    t50 = (t50 + 1);
    t26 = (t23 + 12U);
    *((unsigned int *)t26) = t50;
    t20 = xsi_base_array_concat(t20, t44, t21, (char)97, t14, t47, (char)99, t33, (char)101);
    t26 = (t24 + 56U);
    t27 = *((char **)t26);
    t26 = (t27 + 0);
    t59 = (0 - 22);
    t50 = (t59 * -1);
    t50 = (t50 + 1);
    t53 = (1U * t50);
    t55 = (t53 + 1U);
    memcpy(t26, t20, t55);
    t7 = (t12 + 56U);
    t8 = *((char **)t7);
    t7 = (t11 + 0U);
    t25 = *((int *)t7);
    t10 = (t25 - 10);
    t41 = (t10 * 1U);
    t42 = (0 + t41);
    t14 = (t8 + t42);
    t17 = ((IEEE_P_2592010699) + 4024);
    t18 = (t47 + 0U);
    t19 = (t18 + 0U);
    *((int *)t19) = 10;
    t19 = (t18 + 4U);
    *((int *)t19) = 0;
    t19 = (t18 + 8U);
    *((int *)t19) = -1;
    t45 = (0 - 10);
    t43 = (t45 * -1);
    t43 = (t43 + 1);
    t19 = (t18 + 12U);
    *((unsigned int *)t19) = t43;
    t15 = xsi_base_array_concat(t15, t44, t17, (char)97, t14, t47, (char)99, (unsigned char)2, (char)101);
    t19 = (t12 + 56U);
    t20 = *((char **)t19);
    t19 = (t20 + 0);
    t48 = (0 - 10);
    t43 = (t48 * -1);
    t43 = (t43 + 1);
    t46 = (1U * t43);
    t49 = (t46 + 1U);
    memcpy(t19, t15, t49);

LAB6:    if (t9 == t13)
        goto LAB7;

LAB23:    t25 = (t9 + 1);
    t9 = t25;
    goto LAB4;

LAB8:    t18 = (t24 + 56U);
    t19 = *((char **)t18);
    t18 = (t22 + 0U);
    t48 = *((int *)t18);
    t46 = (t48 - 3);
    t49 = (t46 * 1U);
    t50 = (0 + t49);
    t20 = (t19 + t50);
    t21 = (t51 + 0U);
    t23 = (t21 + 0U);
    *((int *)t23) = 3;
    t23 = (t21 + 4U);
    *((int *)t23) = 0;
    t23 = (t21 + 8U);
    *((int *)t23) = -1;
    t52 = (0 - 3);
    t53 = (t52 * -1);
    t53 = (t53 + 1);
    t23 = (t21 + 12U);
    *((unsigned int *)t23) = t53;
    t23 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t47, t20, t51, 7);
    t26 = (t24 + 56U);
    t27 = *((char **)t26);
    t26 = (t22 + 0U);
    t54 = *((int *)t26);
    t53 = (t54 - 3);
    t55 = (t53 * 1U);
    t56 = (0 + t55);
    t29 = (t27 + t56);
    t30 = (t47 + 12U);
    t57 = *((unsigned int *)t30);
    t58 = (1U * t57);
    memcpy(t29, t23, t58);
    goto LAB9;

LAB11:    t17 = (t24 + 56U);
    t18 = *((char **)t17);
    t17 = (t22 + 0U);
    t48 = *((int *)t17);
    t43 = (t48 - 7);
    t46 = (t43 * 1U);
    t49 = (0 + t46);
    t19 = (t18 + t49);
    t20 = (t51 + 0U);
    t21 = (t20 + 0U);
    *((int *)t21) = 7;
    t21 = (t20 + 4U);
    *((int *)t21) = 4;
    t21 = (t20 + 8U);
    *((int *)t21) = -1;
    t52 = (4 - 7);
    t50 = (t52 * -1);
    t50 = (t50 + 1);
    t21 = (t20 + 12U);
    *((unsigned int *)t21) = t50;
    t21 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t47, t19, t51, 7);
    t23 = (t24 + 56U);
    t26 = *((char **)t23);
    t23 = (t22 + 0U);
    t54 = *((int *)t23);
    t50 = (t54 - 7);
    t53 = (t50 * 1U);
    t55 = (0 + t53);
    t27 = (t26 + t55);
    t29 = (t47 + 12U);
    t56 = *((unsigned int *)t29);
    t57 = (1U * t56);
    memcpy(t27, t21, t57);
    goto LAB12;

LAB14:    t17 = (t24 + 56U);
    t18 = *((char **)t17);
    t17 = (t22 + 0U);
    t48 = *((int *)t17);
    t43 = (t48 - 11);
    t46 = (t43 * 1U);
    t49 = (0 + t46);
    t19 = (t18 + t49);
    t20 = (t51 + 0U);
    t21 = (t20 + 0U);
    *((int *)t21) = 11;
    t21 = (t20 + 4U);
    *((int *)t21) = 8;
    t21 = (t20 + 8U);
    *((int *)t21) = -1;
    t52 = (8 - 11);
    t50 = (t52 * -1);
    t50 = (t50 + 1);
    t21 = (t20 + 12U);
    *((unsigned int *)t21) = t50;
    t21 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t47, t19, t51, 3);
    t23 = (t24 + 56U);
    t26 = *((char **)t23);
    t23 = (t22 + 0U);
    t54 = *((int *)t23);
    t50 = (t54 - 11);
    t53 = (t50 * 1U);
    t55 = (0 + t53);
    t27 = (t26 + t55);
    t29 = (t47 + 12U);
    t56 = *((unsigned int *)t29);
    t57 = (1U * t56);
    memcpy(t27, t21, t57);
    goto LAB15;

LAB17:    t17 = (t24 + 56U);
    t18 = *((char **)t17);
    t17 = (t22 + 0U);
    t48 = *((int *)t17);
    t43 = (t48 - 15);
    t46 = (t43 * 1U);
    t49 = (0 + t46);
    t19 = (t18 + t49);
    t20 = (t51 + 0U);
    t21 = (t20 + 0U);
    *((int *)t21) = 15;
    t21 = (t20 + 4U);
    *((int *)t21) = 12;
    t21 = (t20 + 8U);
    *((int *)t21) = -1;
    t52 = (12 - 15);
    t50 = (t52 * -1);
    t50 = (t50 + 1);
    t21 = (t20 + 12U);
    *((unsigned int *)t21) = t50;
    t21 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t47, t19, t51, 3);
    t23 = (t24 + 56U);
    t26 = *((char **)t23);
    t23 = (t22 + 0U);
    t54 = *((int *)t23);
    t50 = (t54 - 15);
    t53 = (t50 * 1U);
    t55 = (0 + t53);
    t27 = (t26 + t55);
    t29 = (t47 + 12U);
    t56 = *((unsigned int *)t29);
    t57 = (1U * t56);
    memcpy(t27, t21, t57);
    goto LAB18;

LAB20:    t17 = (t24 + 56U);
    t18 = *((char **)t17);
    t17 = (t22 + 0U);
    t48 = *((int *)t17);
    t43 = (t48 - 19);
    t46 = (t43 * 1U);
    t49 = (0 + t46);
    t19 = (t18 + t49);
    t20 = (t51 + 0U);
    t21 = (t20 + 0U);
    *((int *)t21) = 19;
    t21 = (t20 + 4U);
    *((int *)t21) = 16;
    t21 = (t20 + 8U);
    *((int *)t21) = -1;
    t52 = (16 - 19);
    t50 = (t52 * -1);
    t50 = (t50 + 1);
    t21 = (t20 + 12U);
    *((unsigned int *)t21) = t50;
    t21 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t47, t19, t51, 3);
    t23 = (t24 + 56U);
    t26 = *((char **)t23);
    t23 = (t22 + 0U);
    t54 = *((int *)t23);
    t50 = (t54 - 19);
    t53 = (t50 * 1U);
    t55 = (0 + t53);
    t27 = (t26 + t55);
    t29 = (t47 + 12U);
    t56 = *((unsigned int *)t29);
    t57 = (1U * t56);
    memcpy(t27, t21, t57);
    goto LAB21;

LAB24:;
}

static void work_a_3807574445_3212880686_p_0(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    unsigned int t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(91, ng2);

LAB3:    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = work_a_3807574445_3212880686_sub_894001845_3057020925(t0, t1, t3);
    t4 = (t1 + 12U);
    t5 = *((unsigned int *)t4);
    t5 = (t5 * 1U);
    t6 = (24U != t5);
    if (t6 == 1)
        goto LAB5;

LAB6:    t7 = (t0 + 4024);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 24U);
    xsi_driver_first_trans_fast(t7);

LAB2:    t12 = (t0 + 3896);
    *((int *)t12) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(24U, t5, 0);
    goto LAB6;

}

static void work_a_3807574445_3212880686_p_1(char *t0)
{
    char t9[16];
    char t11[16];
    char t16[16];
    char *t1;
    char *t3;
    char *t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    char *t8;
    char *t10;
    char *t12;
    char *t13;
    int t14;
    unsigned int t15;
    char *t17;
    int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(95, ng2);

LAB3:    t1 = (t0 + 6380);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t5 = (23 - 1);
    t6 = (t5 * 1U);
    t7 = (0 + t6);
    t3 = (t4 + t7);
    t10 = ((IEEE_P_2592010699) + 4024);
    t12 = (t11 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 1;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t14 = (1 - 0);
    t15 = (t14 * 1);
    t15 = (t15 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t15;
    t13 = (t16 + 0U);
    t17 = (t13 + 0U);
    *((int *)t17) = 1;
    t17 = (t13 + 4U);
    *((int *)t17) = 0;
    t17 = (t13 + 8U);
    *((int *)t17) = -1;
    t18 = (0 - 1);
    t15 = (t18 * -1);
    t15 = (t15 + 1);
    t17 = (t13 + 12U);
    *((unsigned int *)t17) = t15;
    t8 = xsi_base_array_concat(t8, t9, t10, (char)97, t1, t11, (char)97, t3, t16, (char)101);
    t15 = (2U + 2U);
    t19 = (4U != t15);
    if (t19 == 1)
        goto LAB5;

LAB6:    t17 = (t0 + 4088);
    t20 = (t17 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t8, 4U);
    xsi_driver_first_trans_fast(t17);

LAB2:    t24 = (t0 + 3912);
    *((int *)t24) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(4U, t15, 0);
    goto LAB6;

}

static void work_a_3807574445_3212880686_p_2(char *t0)
{
    char t11[16];
    char t13[16];
    char t24[16];
    char *t1;
    char *t3;
    char *t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned char t9;
    char *t10;
    char *t12;
    char *t14;
    char *t15;
    int t16;
    unsigned int t17;
    char *t18;
    int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned char t22;
    char *t23;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned char t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;

LAB0:    xsi_set_current_line(98, ng2);

LAB3:    t1 = (t0 + 6382);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t5 = (0 - 23);
    t6 = (t5 * -1);
    t7 = (1U * t6);
    t8 = (0 + t7);
    t3 = (t4 + t8);
    t9 = *((unsigned char *)t3);
    t12 = ((IEEE_P_2592010699) + 4024);
    t14 = (t13 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 0;
    t15 = (t14 + 4U);
    *((int *)t15) = 1;
    t15 = (t14 + 8U);
    *((int *)t15) = 1;
    t16 = (1 - 0);
    t17 = (t16 * 1);
    t17 = (t17 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t17;
    t10 = xsi_base_array_concat(t10, t11, t12, (char)97, t1, t13, (char)99, t9, (char)101);
    t15 = (t0 + 1352U);
    t18 = *((char **)t15);
    t19 = (4 - 23);
    t17 = (t19 * -1);
    t20 = (1U * t17);
    t21 = (0 + t20);
    t15 = (t18 + t21);
    t22 = *((unsigned char *)t15);
    t25 = ((IEEE_P_2592010699) + 4024);
    t23 = xsi_base_array_concat(t23, t24, t25, (char)97, t10, t11, (char)99, t22, (char)101);
    t26 = (2U + 1U);
    t27 = (t26 + 1U);
    t28 = (4U != t27);
    if (t28 == 1)
        goto LAB5;

LAB6:    t29 = (t0 + 4152);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t23, 4U);
    xsi_driver_first_trans_fast(t29);

LAB2:    t34 = (t0 + 3928);
    *((int *)t34) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(4U, t27, 0);
    goto LAB6;

}

static void work_a_3807574445_3212880686_p_3(char *t0)
{
    char t8[16];
    char t10[16];
    char t17[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t9;
    char *t11;
    char *t12;
    int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(101, ng2);

LAB3:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = (23 - 23);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 1672U);
    t7 = *((char **)t6);
    t9 = ((IEEE_P_2592010699) + 4024);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 23;
    t12 = (t11 + 4U);
    *((int *)t12) = 8;
    t12 = (t11 + 8U);
    *((int *)t12) = -1;
    t13 = (8 - 23);
    t14 = (t13 * -1);
    t14 = (t14 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t14;
    t12 = (t0 + 6312U);
    t6 = xsi_base_array_concat(t6, t8, t9, (char)97, t1, t10, (char)97, t7, t12, (char)101);
    t15 = (t0 + 1512U);
    t16 = *((char **)t15);
    t18 = ((IEEE_P_2592010699) + 4024);
    t19 = (t0 + 6312U);
    t15 = xsi_base_array_concat(t15, t17, t18, (char)97, t6, t8, (char)97, t16, t19, (char)101);
    t14 = (16U + 4U);
    t20 = (t14 + 4U);
    t21 = (24U != t20);
    if (t21 == 1)
        goto LAB5;

LAB6:    t22 = (t0 + 4216);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t15, 24U);
    xsi_driver_first_trans_fast_port(t22);

LAB2:    t27 = (t0 + 3944);
    *((int *)t27) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(24U, t20, 0);
    goto LAB6;

}


extern void work_a_3807574445_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3807574445_3212880686_p_0,(void *)work_a_3807574445_3212880686_p_1,(void *)work_a_3807574445_3212880686_p_2,(void *)work_a_3807574445_3212880686_p_3};
	static char *se[] = {(void *)work_a_3807574445_3212880686_sub_894001845_3057020925};
	xsi_register_didat("work_a_3807574445_3212880686", "isim/tb_bcd_isim_beh.exe.sim/work/a_3807574445_3212880686.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
