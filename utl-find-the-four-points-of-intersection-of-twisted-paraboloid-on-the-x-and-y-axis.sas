    %let pgm=utl-find-the-four-points-of-intersection-of-twisted-paraboloid-on-the-x-and-y-axis;

    Find the four points of intersection of twisted paraboloid on the x and y axis;

    github
    https://tinyurl.com/35jyn539
    https://github.com/rogerjdeangelis/utl-find-the-four-points-of-intersection-of-twisted-paraboloid-on-the-x-and-y-axis


    Equation

          Find the 4 points of imtersection 2 on the x axis and 2 on the y axis

          Twisted Paraboloid z = x**2 + y**2 - exp(-4*x**2)

          Solve for the 2 points on the y axis that intersect the x axis (z=0)

            0 = x**2 + y**2 - exp(-4*x**2)
            0 = y**2 - exp(-4*0**2)

            y**2 = 1
            y= -1 or +1
            so the intesection is
               (0,y) = (0,1)
               (0,y) = (0,-1)

         Use sympy to solve for the 2 points on the y axis that intersect the y axis

             x= -exp(-LambertW(4)/2) or +exp(-LambertW(4)/2)

             (x,0) = (-0.548217081363998,0)
             (x,0) = (+0.548217081363998,0)

    Contour plot on end

    /*               _     _
     _ __  _ __ ___ | |__ | | ___ _ __ ___
    | `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
    | |_) | | | (_) | |_) | |  __/ | | | | |
    | .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
    |_|
    */

    /********************************************************************************************************************************/
    /*                  |                                         |                                                                 */
    /* INPUT            |              PROCESS                    |                            OUTPUT                               */
    /*                  |                                         |                                                                 */
    /*  z=x**2+y**2     | options ls=255;                         |Four Intersections (Z=0) on x anf y axis                        */
    /*    -exp(-4*x**3) | %utl_submit_py64_310x("                 |                                                                 */
    /*  Two lines (z=0) | from sympy import symbols,exp,solve;    |(x,y=0): (-exp(-LambertW(4)/2),0),                               */
    /*                  | from scipy.special import lambertw;     |         (exp(-LambertW(4)/2),0)                                 */
    /*  x=0 X axis      | import pyperclip as pc;                 |                                                                 */
    /*  y=0 Y axis      | x, y, z = symbols('x y z', real=True);  |(x,y=0): -0.548217081363998                                      */
    /*                  | yy=0;                                   |(x,y=0): 0.548217081363998                                       */
    /*                  | z1 = x**2 + yy**2 - exp(-4*x**2);       |                                                                 */
    /*                  | z2 = 0;                                 |(y,x=0): [(-1,), (1,)]                                           */
    /*                  | solxplane = solve([z1-z2], x);          |                                                                 */
    /*                  | print(f'(x,0): {solxplane}');           |                                                                 */
    /*                  | xx=0;                                   |                                X                                */
    /*                  | z1 = xx**2 + y**2 - exp(-4*xx**2);      |    -1.2  -0.8      -0.4        0       0.4       0.8     1.2    */
    /*                  | z2 = 0;                                 |    -+-----+---------+---------+--------+---------+------ +      */
    /*                  | print(f'(x,0): {-exp(-lambertw(4)/2)}');|   Y|2.5-3,2                   |                          |      */
    /*                  | print(f'(x,0): {exp(-lambertw(4)/2)}'); | 1.5+        ********        OO|OOO         ********      +1.5   */
    /*                  | solyplane = solve([z1-z2], y);          |    |    ********        OOOO  |  OOOOOO        ********  |      */
    /*                  | print(f'y,0): {solyplane}');            |    |Z= 1.8 to 2.5    OOOO   [Y=1]  OOOOOOO   Z=1.8 to 2.5|      */
    /*                  | ");                                     |    | *****        OOOOOOO     |       OOOOOOO        ****|      */
    /*                  |                                         |    | **        OOOOOOO   Z=-.3 to +4     OOOOOOO       **|      */
    /*                  |                                         | 0.9+         OOOOOOO         ...           OOOOOOO       +0.9   */
    /*                  |                                         |    |       OOOOOOO        ....|......        OOOOOOO     |      */
    /*                  |                                         |    |     OOOOOOOO  Z=0  ......|........       OOOOOOOO   |      */
    /*                  |                                         |    |   OOOOOOOO In Here ......|.........        OOOOOOOO |      */
    /*                  |                                         |    | OOOOOOOOO        ........|..........        OOOOOOOO|      */
    /*                  |                                         | 0.3+ OOOOOOOO        .........|...........       OOOOOOO  0.3   */
    /*                  |                                         |    | OOOOOOOO       .... Z=-1 to -3.......       OOOOOOO |      */
    /*                  |                                         |   0+----  [X=-.55] -----------|------   [X=+.55] --------+ 0    */
    /*                  |                                         |    |  4 to 1        ..........|............       OOOOOOO|      */
    /*                  |                                         |    | OOOOOOOO Z=0    .........|...........        OOOOOOO|      */
    /*                  |                                         |-0.3+ OOOOOOOOO in here........|..........        OOOOOOOO+-0.3  */
    /*                  |                                         |    |   OOOOOOOO        .......|.........        OOOOOOOO |      */
    /*                  |                                         |    |     OOOOOOOO       ......|........       OOOOOOOO   |      */
    /*                  |                                         |    |       OOOOOOO        ....|......        OOOOOOO     |      */
    /*                  |                                         |    |         OOOOOOO          |            OOOOOOO       |      */
    /*                  |                                         |-0.9+ **        OOOOOOO  Z=-.3 to +4      OOOOOOO1.1to1.8 +-0.9  */
    /*                  |                                         |    | *****        OOOOOOO     |       OOOOOOO        ****|      */
    /*                  |                                         |    |Z=1.8 to 2,5     OOOO   [Y=-1]   OOOOO        *******|      */
    /*                  |                                         |    |    ********        OOOO  |  OOOOOO        ********  |      */
    /*                  |                                         |    |        ********        OO|OOO         ********      |      */
    /*                  |                                         |-1.5+          ******** Z= 1.1 |- 1.8     ********        +-1.5  */
    /*                  |                                         |    -+-----+---------+---------+---------+---------+------+      */
    /*                  |                                         |   -12   -0.8      -0.4        0        0.4       0.8    1.2     */
    /*                  |                                         |                               X                                 */
    /*                  |                                         |        Symbol                Z      Symbol                Z     */
    /*                  |                                         |        .....   -1.000 - -0.295      Blanks   1.116 -  1.821     */
    /*                  |                                         |        Blanks  -0.295 -  0.411      *****    1.821 -  2.526     */
    /*                  |                                         |        OOOOO    0.411 -  1.116      Blanks   2.526 -  3.232     */
    /*                  |                                         |                                                                 */
    /*                  |                                         |                                                                 */
    /*                  |                                         |                                                                 */
    /********************************************************************************************************************************/

    /*                   _
    (_)_ __  _ __  _   _| |_
    | | `_ \| `_ \| | | | __|
    | | | | | |_) | |_| | |_
    |_|_| |_| .__/ \__,_|\__|
            |_|
    */

     z=x**2+y**2-
                -exp(-4*x**3)

     Two lines (z=0)

     x=0
     y=0

          Find x1,x2,y1,y2
          Find the 4 points of imtersection 2 on the x axis and 2 on the y axis
                                         Z
         -1.2      -0.8      -0.4       0.0       0.4       0.8       1.2
         --+---------+---------+---------+---------+---------+---------+--
       Y |                               |                               |    Y
     1.5 +      #######********WWWWWWWWWO|OOWWWWWWWWW********######      +  1.5
         |      ###********WWWWWWWWOOOOOO|OOOOOOOWWWWWWWW********##      |
         |      ********WWWWWWWWOOOOOOOOO|OOOOOOOOOOWWWWWWWW*******      |
         |      *****WWWWWWWWOOOOOOO     |      OOOOOOOWWWWWWWW****      |
         |      **WWWWWWWWOOOOOOO        Y2        OOOOOOOWWWWWWWW*      |
     0.9 +      WWWWWWWWOOOOOOO          |           OOOOOOOWWWWWWW      +  0.9
         |      WWWWWWOOOOOOO        ....|.....        OOOOOOOWWWWW      |
         |      WWWWOOOOOOOO       ......|.......       OOOOOOOOWWW      |
         |      WWOOOOOOOO        .......|........        OOOOOOOOW      |
         |      OOOOOOOOO Z=0    ........|......... Z=0    OOOOOOOO      |
     0.3 +      OOOOOOOO IN HERE.........|.......... IN HERE OOOOOO      +  0.3
         |      OOOOOOOO       ..........|...........       OOOOOOO      |
      0  |---------------- X1 -----------|------------ X2----------------| 0
         |      OOOOOOOO       ..........|...........       OOOOOOO      |
         |      OOOOOOOO        .........|..........        OOOOOOO      |
    -0.3 +      OOOOOOOOO        ........|.........        OOOOOOOO      + -0.3
         |      WWOOOOOOOO        .......|........        OOOOOOOOW      |
         |      WWWWOOOOOOOO       ......|.......       OOOOOOOOWWW      |
         |      WWWWWWOOOOOOO        ....|.....        OOOOOOOWWWWW      |
         |      WWWWWWWWOOOOOOO          |           OOOOOOOWWWWWWW      |
    -0.9 +      **WWWWWWWWOOOOOOO        Y1        OOOOOOOWWWWWWWW*      + -0.9
         |      *****WWWWWWWWOOOOOOO     |      OOOOOOOWWWWWWWW****      |
         |      ********WWWWWWWWOOOOOOOOO|OOOOOOOOOOWWWWWWWW*******      |
         |      ###********WWWWWWWWOOOOOO|OOOOOOOWWWWWWWW********##      |
         |      #######********WWWWWWWWWO|OOWWWWWWWWW********######      |
    -1.5 +      #########********WWWWWWWW|WWWWWWWWW********########      + -1.5
         --+---------+---------+---------+---------+---------+---------+--
         -1.2      -0.8      -0.4       0.0       0.4       0.8       1.2
                                         X

             Symbol                Z     Symbol                Z

             .....   -1.000 - -0.295     WWWWW    1.116 -  1.821
             BLANK   -0.295 -  0.411     *****    1.821 -  2.526
             OOOOO    0.411 -  1.116     #####    2.526 -  3.232


    Just for documentation and checking
    data saddle;
      do x = -1 to 1 by 0.01;
        do y = -1.5 to 1.5 by 0.01;
          z = x**2 + y**2 - exp(-4*x**2);
          output;
        end;
      end;
    run;


    options ls=70 ps=44;
    proc plot data=saddle;
    plot y*x=z / contour=6 box vref=0 href=0;
    run;

    /*
     _ __  _ __ ___   ___ ___  ___ ___
    | `_ \| `__/ _ \ / __/ _ \/ __/ __|
    | |_) | | | (_) | (_|  __/\__ \__ \
    | .__/|_|  \___/ \___\___||___/___/
    |_|
    */

    options ls=255;
    %utl_submit_py64_310x("
    from sympy import symbols,exp,solve;
    from scipy.special import lambertw;
    import pyperclip as pc;
    x, y, z = symbols('x y z', real=True);
    yy=0;
    z1 = x**2 + yy**2 - exp(-4*x**2);
    z2 = 0;
    solxplane = solve([z1-z2], x);
    print(f'(x,0): {solxplane}');
    xx=0;
    z1 = xx**2 + y**2 - exp(-4*xx**2);
    z2 = 0;
    print(f'(x,0): {-exp(-lambertw(4)/2)}');
    print(f'(x,0): {exp(-lambertw(4)/2)}');
    solyplane = solve([z1-z2], y);
    print(f'y,0): {solyplane}');
    ");

    /*           _               _
      ___  _   _| |_ _ __  _   _| |_
     / _ \| | | | __| `_ \| | | | __|
    | (_) | |_| | |_| |_) | |_| | |_
     \___/ \__,_|\__| .__/ \__,_|\__|
                    |_|
    */

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /*  Y=0. X intersects (note z=0)                                                                                          */
    /*                                                                                                                        */
    /*    (x,0): [(-exp(-LambertW(4)/2),), (exp(-LambertW(4)/2),)]                                                            */
    /*                                                                                                                        */
    /*    (x,0): -0.548217081363998                                                                                           */
    /*    (x,0): 0.548217081363998                                                                                            */
    /*                                                                                                                        */
    /*  X=0. Y intersects note z=0                                                                                            */
    /*                                                                                                                        */
    /*    y,0): [(-1,), (1,)]                                                                                                 */
    /*                                                                                                                        */
    /*                                   X                                                                                    */
    /*       -1.2  -0.8      -0.4        0        0.4       0.8   1.2                                                         */
    /*       --+-----+---------+---------+--------+---------+------+--                                                        */
    /*     Y | 2.5-3,2                   |                             |                                                      */
    /*   1.5 +         ********        OO|OOO         ********         +  1.5                                                 */
    /*       |     ********        OOOO  |  OOOOOO        ********     |                                                      */
    /*       |Z= 1.8 to 2.5     OOOO Y=[Z=1]  OOOOOOO    Z=1.8 to 2.5  |                                                      */
    /*       |  *****        OOOOOOO     |       OOOOOOO        ****   |                                                      */
    /*       |  **        OOOOOOO   Z=-.3 to +4     OOOOOOO       **   |                                                      */
    /*   0.9 +          OOOOOOO         ...           OOOOOOO          +  0.9                                                 */
    /*       |        OOOOOOO        ....|......        OOOOOOO        |                                                      */
    /*       |      OOOOOOOO Z=0   ......|........       OOOOOOOO      |                                                      */
    /*       |    OOOOOOOO In Here.......|.........        OOOOOOOO    |                                                      */
    /*       |  OOOOOOOOO        ........|..........        OOOOOOOO   |                                                      */
    /*   0.3 +  OOOOOOOOZ=-.3to1.........|...........-3to1  OOOOOOO   +  0.3                                                  */
    /*       |  OOOOOOOO       .... Z=-1 to -3.......       OOOOOOO    |                                                      */
    /*     0 +-----  [X=-.55] -----------|------   [X=+.55] -----------+ 0                                                    */
    /*       |   4 to 1        ..........|............       OOOOOOO   |                                                      */
    /*       |  OOOOOOOO        .........|...........        OOOOOOO   |                                                      */
    /*  -0.3 +  OOOOOOOOO        ........|..........        OOOOOOOO   + -0.3                                                 */
    /*       |    OOOOOOOO        .......|.........        OOOOOOOO    |                                                      */
    /*       |      OOOOOOOO       ......|........       OOOOOOOO      |                                                      */
    /*       |        OOOOOOO        ....|......        OOOOOOO        |                                                      */
    /*       |          OOOOOOO          |            OOOOOOO          |                                                      */
    /*  -0.9 +  **        OOOOOOO  Z=-.3 to +4      OOOOOOO 1.1to1.8*   + -0.9                                                */
    /*       |  *****        OOOOOOO     |       OOOOOOO        ****   |                                                      */
    /*       |Z=1.8 to 2,5      OOOO Y=[Z=-1]   OOOOO        *******   |                                                      */
    /*       |     ********        OOOO  |  OOOOOO        ********     |                                                      */
    /*       |         ********        OO|OOO         ********         |                                                      */
    /*  -1.5 +           ******** Z= 1.1 |- 1.8     ********           + -1.5                                                 */
    /*       --+-----+---------+---------+---------+---------+------+--                                                       */
    /*      -1.2   -0.8      -0.4        0         0.4       0.8    1.2                                                       */
    /*                                   X                                                                                    */
    /*           Symbol                Z      Symbol                Z                                                         */
    /*           .....   -1.000 - -0.295      Blanks   1.116 -  1.821                                                         */
    /*           Blanks  -0.295 -  0.411      *****    1.821 -  2.526                                                         */
    /*           OOOOO    0.411 -  1.116      Blanks   2.526 -  3.232                                                         */
    /*                                                                                                                        */
    /**************************************************************************************************************************/

    /*              _
      ___ _ __   __| |
     / _ \ `_ \ / _` |
    |  __/ | | | (_| |
     \___|_| |_|\__,_|

    */
