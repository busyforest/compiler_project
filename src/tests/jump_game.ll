declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @canJump( i32* %r100, i32 %r101 ) {
bb1:
  %r129 = alloca i32
  %r120 = alloca i32
  %r111 = alloca i32
  %r110 = alloca [ 10 x i32 ]
  %r102 = alloca i32
  store i32 %r101, i32* %r102
  %r103 = load i32, i32* %r102
  %r104 = icmp eq i32 %r103, 1
  br i1 %r104, label %bb_if_5_10_true, label %bb_if_5_10_false

bb_if_5_10_true:
  ret i32 1
bb_if_5_10_false:
  br label %bb_if_5_10_end

bb_if_5_10_end:
  %r105 = getelementptr i32, i32* %r100, i32 0
  %r106 = load i32, i32* %r105
  %r107 = load i32, i32* %r102
  %r108 = sub i32 %r107, 2
  %r109 = icmp sgt i32 %r106, %r108
  br i1 %r109, label %bb_if_5_14_true, label %bb_if_5_14_false

bb_if_5_14_true:
  ret i32 1
bb_if_5_14_false:
  br label %bb_if_5_14_end

bb_if_5_14_end:
  store i32 0, i32* %r111
  br label %bb_while_5_21_cond

bb_while_5_21_cond:
  %r112 = load i32, i32* %r111
  %r113 = load i32, i32* %r102
  %r114 = sub i32 %r113, 1
  %r115 = icmp slt i32 %r112, %r114
  br i1 %r115, label %bb_while_5_21_whilestms, label %bb_while_5_21_bre

bb_while_5_21_whilestms:
  %r116 = load i32, i32* %r111
  %r117 = getelementptr [10 x i32 ], [10 x i32 ]* %r110, i32 0, i32 %r116
  store i32 0, i32* %r117
  %r118 = load i32, i32* %r111
  %r119 = add i32 %r118, 1
  store i32 %r119, i32* %r111
  br label %bb_while_5_21_cond

bb_while_5_21_bre:
  %r121 = load i32, i32* %r102
  %r122 = sub i32 %r121, 1
  store i32 %r122, i32* %r120
  %r123 = load i32, i32* %r120
  %r124 = getelementptr [10 x i32 ], [10 x i32 ]* %r110, i32 0, i32 %r123
  store i32 1, i32* %r124
  %r125 = load i32, i32* %r102
  %r126 = sub i32 %r125, 2
  store i32 %r126, i32* %r111
  br label %bb_while_5_28_cond

bb_while_5_28_cond:
  %r127 = load i32, i32* %r111
  %r128 = icmp sgt i32 %r127, -1
  br i1 %r128, label %bb_while_5_28_whilestms, label %bb_while_5_28_bre

bb_while_5_28_whilestms:
  %r130 = load i32, i32* %r111
  %r131 = getelementptr i32, i32* %r100, i32 %r130
  %r132 = load i32, i32* %r131
  %r133 = load i32, i32* %r102
  %r134 = sub i32 %r133, 1
  %r135 = load i32, i32* %r111
  %r136 = sub i32 %r134, %r135
  %r137 = icmp slt i32 %r132, %r136
  br i1 %r137, label %bb_if_9_30_true, label %bb_if_9_30_false

bb_if_9_30_true:
  %r138 = load i32, i32* %r111
  %r139 = getelementptr i32, i32* %r100, i32 %r138
  %r140 = load i32, i32* %r139
  store i32 %r140, i32* %r129
  br label %bb_if_9_30_end

bb_if_9_30_false:
  %r141 = load i32, i32* %r102
  %r142 = sub i32 %r141, 1
  %r143 = load i32, i32* %r111
  %r144 = sub i32 %r142, %r143
  store i32 %r144, i32* %r129
  br label %bb_if_9_30_end

bb_if_9_30_end:
  br label %bb_while_9_37_cond

bb_while_9_37_cond:
  %r145 = load i32, i32* %r129
  %r146 = icmp sgt i32 %r145, -1
  br i1 %r146, label %bb_while_9_37_whilestms, label %bb_while_9_37_bre

bb_while_9_37_whilestms:
  %r147 = load i32, i32* %r111
  %r148 = load i32, i32* %r129
  %r149 = add i32 %r147, %r148
  store i32 %r149, i32* %r120
  %r150 = load i32, i32* %r120
  %r151 = getelementptr [10 x i32 ], [10 x i32 ]* %r110, i32 0, i32 %r150
  %r152 = load i32, i32* %r151
  %r153 = icmp ne i32 %r152, 0
  br i1 %r153, label %bb_if_13_39_true, label %bb_if_13_39_false

bb_if_13_39_true:
  %r154 = load i32, i32* %r111
  %r155 = getelementptr [10 x i32 ], [10 x i32 ]* %r110, i32 0, i32 %r154
  store i32 1, i32* %r155
  br label %bb_if_13_39_end

bb_if_13_39_false:
  br label %bb_if_13_39_end

bb_if_13_39_end:
  %r156 = load i32, i32* %r129
  %r157 = sub i32 %r156, 1
  store i32 %r157, i32* %r129
  br label %bb_while_9_37_cond

bb_while_9_37_bre:
  %r158 = load i32, i32* %r111
  %r159 = sub i32 %r158, 1
  store i32 %r159, i32* %r111
  br label %bb_while_5_28_cond

bb_while_5_28_bre:
  %r160 = getelementptr [10 x i32 ], [10 x i32 ]* %r110, i32 0, i32 0
  %r161 = load i32, i32* %r160
  ret i32 %r161
}

define i32 @main( ) {
bb2:
  %r162 = alloca i32
  %r163 = alloca [ 10 x i32 ]
  %r164 = getelementptr [10 x i32 ], [10 x i32 ]* %r163, i32 0, i32 0
  store i32 3, i32* %r164
  %r165 = getelementptr [10 x i32 ], [10 x i32 ]* %r163, i32 0, i32 1
  store i32 3, i32* %r165
  %r166 = getelementptr [10 x i32 ], [10 x i32 ]* %r163, i32 0, i32 2
  store i32 9, i32* %r166
  %r167 = getelementptr [10 x i32 ], [10 x i32 ]* %r163, i32 0, i32 3
  store i32 0, i32* %r167
  %r168 = getelementptr [10 x i32 ], [10 x i32 ]* %r163, i32 0, i32 4
  store i32 0, i32* %r168
  %r169 = getelementptr [10 x i32 ], [10 x i32 ]* %r163, i32 0, i32 5
  store i32 1, i32* %r169
  %r170 = getelementptr [10 x i32 ], [10 x i32 ]* %r163, i32 0, i32 6
  store i32 1, i32* %r170
  %r171 = getelementptr [10 x i32 ], [10 x i32 ]* %r163, i32 0, i32 7
  store i32 5, i32* %r171
  %r172 = getelementptr [10 x i32 ], [10 x i32 ]* %r163, i32 0, i32 8
  store i32 7, i32* %r172
  %r173 = getelementptr [10 x i32 ], [10 x i32 ]* %r163, i32 0, i32 9
  store i32 8, i32* %r173
  store i32 10, i32* %r162
  %r174 = getelementptr [10 x i32 ], [10 x i32 ]* %r163, i32 0, i32 0
  %r175 = load i32, i32* %r162
  %r176 = call i32 @canJump(i32* %r174, i32 %r175)
  store i32 %r176, i32* %r162
  %r177 = load i32, i32* %r162
  ret i32 %r177
}

