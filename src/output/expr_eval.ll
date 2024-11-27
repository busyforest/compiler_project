; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }

@TOKEN_NUM = global i32 0
@TOKEN_OTHER = global i32 1
@last_char = global i32 32
@num = global i32 0
@other = global i32 0
@cur_token = global i32 0
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @before_main, ptr null }]
@llvm.global_dtors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @after_main, ptr null }]
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_sysy_us = dso_local global [1024 x i32] zeroinitializer, align 16
@_sysy_s = dso_local global [1024 x i32] zeroinitializer, align 16
@_sysy_m = dso_local global [1024 x i32] zeroinitializer, align 16
@_sysy_h = dso_local global [1024 x i32] zeroinitializer, align 16
@_sysy_idx = dso_local global i32 0, align 4
@stderr = external global ptr, align 8
@.str.5 = private unnamed_addr constant [35 x i8] c"Timer@%04d-%04d: %dH-%dM-%dS-%dus\0A\00", align 1
@_sysy_l1 = dso_local global [1024 x i32] zeroinitializer, align 16
@_sysy_l2 = dso_local global [1024 x i32] zeroinitializer, align 16
@.str.6 = private unnamed_addr constant [25 x i8] c"TOTAL: %dH-%dM-%dS-%dus\0A\00", align 1
@_sysy_start = dso_local global %struct.timeval zeroinitializer, align 8
@_sysy_end = dso_local global %struct.timeval zeroinitializer, align 8

define i32 @next_char() {
bb1:
  %r100 = call i32 @getch()
  store i32 %r100, ptr @last_char, align 4
  %r101 = load i32, ptr @last_char, align 4
  ret i32 %r101
}

define i32 @is_space(i32 %r102) {
bb2:
  %r103 = alloca i32, align 4
  store i32 %r102, ptr %r103, align 4
  %r104 = load i32, ptr %r103, align 4
  %r105 = icmp eq i32 %r104, 32
  br i1 %r105, label %bb_if_5_24_true, label %bb23_24_next

bb23_24_next:                                     ; preds = %bb2
  %r106 = load i32, ptr %r103, align 4
  %r107 = icmp eq i32 %r106, 10
  br i1 %r107, label %bb_if_5_24_true, label %bb_if_5_24_false

bb_if_5_24_true:                                  ; preds = %bb23_24_next, %bb2
  ret i32 1

bb_if_5_24_false:                                 ; preds = %bb23_24_next
  ret i32 0

bb_if_5_24_end:                                   ; No predecessors!
  ret i32 -1
}

define i32 @is_num(i32 %r108) {
bb3:
  %r109 = alloca i32, align 4
  store i32 %r108, ptr %r109, align 4
  %r110 = load i32, ptr %r109, align 4
  %r111 = icmp sge i32 %r110, 48
  br i1 %r111, label %bb23_36_next, label %bb_if_5_36_false

bb23_36_next:                                     ; preds = %bb3
  %r112 = load i32, ptr %r109, align 4
  %r113 = icmp sle i32 %r112, 57
  br i1 %r113, label %bb_if_5_36_true, label %bb_if_5_36_false

bb_if_5_36_true:                                  ; preds = %bb23_36_next
  ret i32 1

bb_if_5_36_false:                                 ; preds = %bb23_36_next, %bb3
  ret i32 0

bb_if_5_36_end:                                   ; No predecessors!
  ret i32 -1
}

define i32 @next_token() {
bb4:
  br label %bb_while_5_48_cond

bb_while_5_48_cond:                               ; preds = %bb_while_5_48_whilestms, %bb4
  %r114 = load i32, ptr @last_char, align 4
  %r115 = call i32 @is_space(i32 %r114)
  %r116 = icmp ne i32 %r115, 0
  br i1 %r116, label %bb_while_5_48_whilestms, label %bb_while_5_48_bre

bb_while_5_48_whilestms:                          ; preds = %bb_while_5_48_cond
  %r117 = call i32 @next_char()
  br label %bb_while_5_48_cond

bb_while_5_48_bre:                                ; preds = %bb_while_5_48_cond
  %r118 = load i32, ptr @last_char, align 4
  %r119 = call i32 @is_num(i32 %r118)
  %r120 = icmp ne i32 %r119, 0
  br i1 %r120, label %bb_if_5_52_true, label %bb_if_5_52_false

bb_if_5_52_true:                                  ; preds = %bb_while_5_48_bre
  %r121 = load i32, ptr @last_char, align 4
  %r122 = sub i32 %r121, 48
  store i32 %r122, ptr @num, align 4
  br label %bb_while_9_55_cond

bb_while_9_55_cond:                               ; preds = %bb_while_9_55_whilestms, %bb_if_5_52_true
  %r123 = call i32 @next_char()
  %r124 = call i32 @is_num(i32 %r123)
  %r125 = icmp ne i32 %r124, 0
  br i1 %r125, label %bb_while_9_55_whilestms, label %bb_while_9_55_bre

bb_while_9_55_whilestms:                          ; preds = %bb_while_9_55_cond
  %r126 = load i32, ptr @num, align 4
  %r127 = mul i32 %r126, 10
  %r128 = load i32, ptr @last_char, align 4
  %r129 = add i32 %r127, %r128
  %r130 = sub i32 %r129, 48
  store i32 %r130, ptr @num, align 4
  br label %bb_while_9_55_cond

bb_while_9_55_bre:                                ; preds = %bb_while_9_55_cond
  %r131 = load i32, ptr @TOKEN_NUM, align 4
  store i32 %r131, ptr @cur_token, align 4
  br label %bb_if_5_52_end

bb_if_5_52_false:                                 ; preds = %bb_while_5_48_bre
  %r132 = load i32, ptr @last_char, align 4
  store i32 %r132, ptr @other, align 4
  %r133 = call i32 @next_char()
  %r134 = load i32, ptr @TOKEN_OTHER, align 4
  store i32 %r134, ptr @cur_token, align 4
  br label %bb_if_5_52_end

bb_if_5_52_end:                                   ; preds = %bb_if_5_52_false, %bb_while_9_55_bre
  %r135 = load i32, ptr @cur_token, align 4
  ret i32 %r135
}

define i32 @panic() {
bb5:
  call void @putch(i32 112)
  call void @putch(i32 97)
  call void @putch(i32 110)
  call void @putch(i32 105)
  call void @putch(i32 99)
  call void @putch(i32 33)
  call void @putch(i32 10)
  %r136 = sub i32 0, 1
  ret i32 %r136
}

define i32 @get_op_prec(i32 %r137) {
bb6:
  %r138 = alloca i32, align 4
  store i32 %r137, ptr %r138, align 4
  %r139 = load i32, ptr %r138, align 4
  %r140 = icmp eq i32 %r139, 43
  br i1 %r140, label %bb_if_5_85_true, label %bb24_85_next

bb24_85_next:                                     ; preds = %bb6
  %r141 = load i32, ptr %r138, align 4
  %r142 = icmp eq i32 %r141, 45
  br i1 %r142, label %bb_if_5_85_true, label %bb_if_5_85_false

bb_if_5_85_true:                                  ; preds = %bb24_85_next, %bb6
  ret i32 10

bb_if_5_85_false:                                 ; preds = %bb24_85_next
  br label %bb_if_5_85_end

bb_if_5_85_end:                                   ; preds = %bb_if_5_85_false
  %r143 = load i32, ptr %r138, align 4
  %r144 = icmp eq i32 %r143, 42
  br i1 %r144, label %bb_if_5_88_true, label %bb24_88_next

bb24_88_next:                                     ; preds = %bb_if_5_85_end
  %r145 = load i32, ptr %r138, align 4
  %r146 = icmp eq i32 %r145, 47
  br i1 %r146, label %bb_if_5_88_true, label %bb38_88_next

bb38_88_next:                                     ; preds = %bb24_88_next
  %r147 = load i32, ptr %r138, align 4
  %r148 = icmp eq i32 %r147, 37
  br i1 %r148, label %bb_if_5_88_true, label %bb_if_5_88_false

bb_if_5_88_true:                                  ; preds = %bb38_88_next, %bb24_88_next, %bb_if_5_85_end
  ret i32 20

bb_if_5_88_false:                                 ; preds = %bb38_88_next
  br label %bb_if_5_88_end

bb_if_5_88_end:                                   ; preds = %bb_if_5_88_false
  ret i32 0
}

define void @stack_push(ptr %r149, i32 %r150) {
bb7:
  %r151 = alloca i32, align 4
  store i32 %r150, ptr %r151, align 4
  %r152 = getelementptr i32, ptr %r149, i32 0
  %r153 = getelementptr i32, ptr %r149, i32 0
  %r154 = load i32, ptr %r153, align 4
  %r155 = add i32 %r154, 1
  store i32 %r155, ptr %r152, align 4
  %r156 = alloca i32, align 4
  %r157 = getelementptr i32, ptr %r149, i32 0
  %r158 = load i32, ptr %r157, align 4
  store i32 %r158, ptr %r156, align 4
  %r159 = load i32, ptr %r156, align 4
  %r160 = getelementptr i32, ptr %r149, i32 %r159
  %r161 = load i32, ptr %r151, align 4
  store i32 %r161, ptr %r160, align 4
  ret void
}

define i32 @stack_pop(ptr %r162) {
bb8:
  %r163 = alloca i32, align 4
  %r164 = getelementptr i32, ptr %r162, i32 0
  %r165 = load i32, ptr %r164, align 4
  store i32 %r165, ptr %r163, align 4
  %r166 = alloca i32, align 4
  %r167 = load i32, ptr %r163, align 4
  %r168 = getelementptr i32, ptr %r162, i32 %r167
  %r169 = load i32, ptr %r168, align 4
  store i32 %r169, ptr %r166, align 4
  %r170 = getelementptr i32, ptr %r162, i32 0
  %r171 = getelementptr i32, ptr %r162, i32 0
  %r172 = load i32, ptr %r171, align 4
  %r173 = sub i32 %r172, 1
  store i32 %r173, ptr %r170, align 4
  %r174 = load i32, ptr %r166, align 4
  ret i32 %r174
}

define i32 @stack_peek(ptr %r175) {
bb9:
  %r176 = alloca i32, align 4
  %r177 = getelementptr i32, ptr %r175, i32 0
  %r178 = load i32, ptr %r177, align 4
  store i32 %r178, ptr %r176, align 4
  %r179 = load i32, ptr %r176, align 4
  %r180 = getelementptr i32, ptr %r175, i32 %r179
  %r181 = load i32, ptr %r180, align 4
  ret i32 %r181
}

define i32 @stack_size(ptr %r182) {
bb10:
  %r183 = getelementptr i32, ptr %r182, i32 0
  %r184 = load i32, ptr %r183, align 4
  ret i32 %r184
}

define i32 @mod(i32 %r185, i32 %r187) {
bb11:
  %r186 = alloca i32, align 4
  store i32 %r185, ptr %r186, align 4
  %r188 = alloca i32, align 4
  store i32 %r187, ptr %r188, align 4
  %r189 = load i32, ptr %r186, align 4
  %r190 = load i32, ptr %r186, align 4
  %r191 = load i32, ptr %r188, align 4
  %r192 = sdiv i32 %r190, %r191
  %r193 = load i32, ptr %r188, align 4
  %r194 = mul i32 %r192, %r193
  %r195 = sub i32 %r189, %r194
  ret i32 %r195
}

define i32 @eval_op(i32 %r196, i32 %r198, i32 %r200) {
bb12:
  %r197 = alloca i32, align 4
  store i32 %r196, ptr %r197, align 4
  %r199 = alloca i32, align 4
  store i32 %r198, ptr %r199, align 4
  %r201 = alloca i32, align 4
  store i32 %r200, ptr %r201, align 4
  %r202 = load i32, ptr %r197, align 4
  %r203 = icmp eq i32 %r202, 43
  br i1 %r203, label %bb_if_5_128_true, label %bb_if_5_128_false

bb_if_5_128_true:                                 ; preds = %bb12
  %r204 = load i32, ptr %r199, align 4
  %r205 = load i32, ptr %r201, align 4
  %r206 = add i32 %r204, %r205
  ret i32 %r206

bb_if_5_128_false:                                ; preds = %bb12
  br label %bb_if_5_128_end

bb_if_5_128_end:                                  ; preds = %bb_if_5_128_false
  %r207 = load i32, ptr %r197, align 4
  %r208 = icmp eq i32 %r207, 45
  br i1 %r208, label %bb_if_5_133_true, label %bb_if_5_133_false

bb_if_5_133_true:                                 ; preds = %bb_if_5_128_end
  %r209 = load i32, ptr %r199, align 4
  %r210 = load i32, ptr %r201, align 4
  %r211 = sub i32 %r209, %r210
  ret i32 %r211

bb_if_5_133_false:                                ; preds = %bb_if_5_128_end
  br label %bb_if_5_133_end

bb_if_5_133_end:                                  ; preds = %bb_if_5_133_false
  %r212 = load i32, ptr %r197, align 4
  %r213 = icmp eq i32 %r212, 42
  br i1 %r213, label %bb_if_5_138_true, label %bb_if_5_138_false

bb_if_5_138_true:                                 ; preds = %bb_if_5_133_end
  %r214 = load i32, ptr %r199, align 4
  %r215 = load i32, ptr %r201, align 4
  %r216 = mul i32 %r214, %r215
  ret i32 %r216

bb_if_5_138_false:                                ; preds = %bb_if_5_133_end
  br label %bb_if_5_138_end

bb_if_5_138_end:                                  ; preds = %bb_if_5_138_false
  %r217 = load i32, ptr %r197, align 4
  %r218 = icmp eq i32 %r217, 47
  br i1 %r218, label %bb_if_5_143_true, label %bb_if_5_143_false

bb_if_5_143_true:                                 ; preds = %bb_if_5_138_end
  %r219 = load i32, ptr %r199, align 4
  %r220 = load i32, ptr %r201, align 4
  %r221 = sdiv i32 %r219, %r220
  ret i32 %r221

bb_if_5_143_false:                                ; preds = %bb_if_5_138_end
  br label %bb_if_5_143_end

bb_if_5_143_end:                                  ; preds = %bb_if_5_143_false
  %r222 = load i32, ptr %r197, align 4
  %r223 = icmp eq i32 %r222, 37
  br i1 %r223, label %bb_if_5_148_true, label %bb_if_5_148_false

bb_if_5_148_true:                                 ; preds = %bb_if_5_143_end
  %r224 = load i32, ptr %r199, align 4
  %r225 = load i32, ptr %r201, align 4
  %r226 = call i32 @mod(i32 %r224, i32 %r225)
  ret i32 %r226

bb_if_5_148_false:                                ; preds = %bb_if_5_143_end
  br label %bb_if_5_148_end

bb_if_5_148_end:                                  ; preds = %bb_if_5_148_false
  ret i32 0
}

define i32 @eval() {
bb13:
  %r296 = alloca i32, align 4
  %r293 = alloca i32, align 4
  %r290 = alloca i32, align 4
  %r269 = alloca i32, align 4
  %r266 = alloca i32, align 4
  %r263 = alloca i32, align 4
  %r248 = alloca i32, align 4
  %r227 = alloca [256 x i32], align 4
  %r228 = alloca [256 x i32], align 4
  %r229 = alloca i32, align 4
  store i32 0, ptr %r229, align 4
  br label %bb_while_5_161_cond

bb_while_5_161_cond:                              ; preds = %bb_while_5_161_whilestms, %bb13
  %r230 = load i32, ptr %r229, align 4
  %r231 = icmp slt i32 %r230, 256
  br i1 %r231, label %bb_while_5_161_whilestms, label %bb_while_5_161_bre

bb_while_5_161_whilestms:                         ; preds = %bb_while_5_161_cond
  %r232 = load i32, ptr %r229, align 4
  %r233 = getelementptr [256 x i32], ptr %r227, i32 0, i32 %r232
  store i32 0, ptr %r233, align 4
  %r234 = load i32, ptr %r229, align 4
  %r235 = getelementptr [256 x i32], ptr %r228, i32 0, i32 %r234
  store i32 0, ptr %r235, align 4
  %r236 = load i32, ptr %r229, align 4
  %r237 = add i32 %r236, 1
  store i32 %r237, ptr %r229, align 4
  br label %bb_while_5_161_cond

bb_while_5_161_bre:                               ; preds = %bb_while_5_161_cond
  %r238 = load i32, ptr @cur_token, align 4
  %r239 = load i32, ptr @TOKEN_NUM, align 4
  %r240 = icmp ne i32 %r238, %r239
  br i1 %r240, label %bb_if_5_168_true, label %bb_if_5_168_false

bb_if_5_168_true:                                 ; preds = %bb_while_5_161_bre
  %r241 = call i32 @panic()
  ret i32 %r241

bb_if_5_168_false:                                ; preds = %bb_while_5_161_bre
  br label %bb_if_5_168_end

bb_if_5_168_end:                                  ; preds = %bb_if_5_168_false
  %r242 = getelementptr [256 x i32], ptr %r227, i32 0, i32 0
  %r243 = load i32, ptr @num, align 4
  call void @stack_push(ptr %r242, i32 %r243)
  %r244 = call i32 @next_token()
  br label %bb_while_5_175_cond

bb_while_5_175_cond:                              ; preds = %bb_if_9_193_end, %bb_if_5_168_end
  %r245 = load i32, ptr @cur_token, align 4
  %r246 = load i32, ptr @TOKEN_OTHER, align 4
  %r247 = icmp eq i32 %r245, %r246
  br i1 %r247, label %bb_while_5_175_whilestms, label %bb_while_5_175_bre

bb_while_5_175_whilestms:                         ; preds = %bb_while_5_175_cond
  %r249 = load i32, ptr @other, align 4
  store i32 %r249, ptr %r248, align 4
  %r250 = load i32, ptr %r248, align 4
  %r251 = call i32 @get_op_prec(i32 %r250)
  %r252 = icmp eq i32 %r251, 0
  br i1 %r252, label %bb_if_9_179_true, label %bb_if_9_179_false

bb_if_9_179_true:                                 ; preds = %bb_while_5_175_whilestms
  br label %bb_while_5_175_bre

bb_if_9_179_false:                                ; preds = %bb_while_5_175_whilestms
  br label %bb_if_9_179_end

bb_if_9_179_end:                                  ; preds = %bb_if_9_179_false
  %r253 = call i32 @next_token()
  br label %bb_while_9_183_cond

bb_while_9_183_cond:                              ; preds = %bb_while_9_183_whilestms, %bb_if_9_179_end
  %r254 = getelementptr [256 x i32], ptr %r228, i32 0, i32 0
  %r255 = call i32 @stack_size(ptr %r254)
  %r256 = icmp ne i32 %r255, 0
  br i1 %r256, label %bb41_183_next, label %bb_while_9_183_bre

bb41_183_next:                                    ; preds = %bb_while_9_183_cond
  %r257 = getelementptr [256 x i32], ptr %r228, i32 0, i32 0
  %r258 = call i32 @stack_peek(ptr %r257)
  %r259 = call i32 @get_op_prec(i32 %r258)
  %r260 = load i32, ptr %r248, align 4
  %r261 = call i32 @get_op_prec(i32 %r260)
  %r262 = icmp sge i32 %r259, %r261
  br i1 %r262, label %bb_while_9_183_whilestms, label %bb_while_9_183_bre

bb_while_9_183_whilestms:                         ; preds = %bb41_183_next
  %r264 = getelementptr [256 x i32], ptr %r228, i32 0, i32 0
  %r265 = call i32 @stack_pop(ptr %r264)
  store i32 %r265, ptr %r263, align 4
  %r267 = getelementptr [256 x i32], ptr %r227, i32 0, i32 0
  %r268 = call i32 @stack_pop(ptr %r267)
  store i32 %r268, ptr %r266, align 4
  %r270 = getelementptr [256 x i32], ptr %r227, i32 0, i32 0
  %r271 = call i32 @stack_pop(ptr %r270)
  store i32 %r271, ptr %r269, align 4
  %r272 = getelementptr [256 x i32], ptr %r227, i32 0, i32 0
  %r273 = load i32, ptr %r263, align 4
  %r274 = load i32, ptr %r269, align 4
  %r275 = load i32, ptr %r266, align 4
  %r276 = call i32 @eval_op(i32 %r273, i32 %r274, i32 %r275)
  call void @stack_push(ptr %r272, i32 %r276)
  br label %bb_while_9_183_cond

bb_while_9_183_bre:                               ; preds = %bb41_183_next, %bb_while_9_183_cond
  %r277 = getelementptr [256 x i32], ptr %r228, i32 0, i32 0
  %r278 = load i32, ptr %r248, align 4
  call void @stack_push(ptr %r277, i32 %r278)
  %r279 = load i32, ptr @cur_token, align 4
  %r280 = load i32, ptr @TOKEN_NUM, align 4
  %r281 = icmp ne i32 %r279, %r280
  br i1 %r281, label %bb_if_9_193_true, label %bb_if_9_193_false

bb_if_9_193_true:                                 ; preds = %bb_while_9_183_bre
  %r282 = call i32 @panic()
  ret i32 %r282

bb_if_9_193_false:                                ; preds = %bb_while_9_183_bre
  br label %bb_if_9_193_end

bb_if_9_193_end:                                  ; preds = %bb_if_9_193_false
  %r283 = getelementptr [256 x i32], ptr %r227, i32 0, i32 0
  %r284 = load i32, ptr @num, align 4
  call void @stack_push(ptr %r283, i32 %r284)
  %r285 = call i32 @next_token()
  br label %bb_while_5_175_cond

bb_while_5_175_bre:                               ; preds = %bb_if_9_179_true, %bb_while_5_175_cond
  %r286 = call i32 @next_token()
  br label %bb_while_5_201_cond

bb_while_5_201_cond:                              ; preds = %bb_while_5_201_whilestms, %bb_while_5_175_bre
  %r287 = getelementptr [256 x i32], ptr %r228, i32 0, i32 0
  %r288 = call i32 @stack_size(ptr %r287)
  %r289 = icmp ne i32 %r288, 0
  br i1 %r289, label %bb_while_5_201_whilestms, label %bb_while_5_201_bre

bb_while_5_201_whilestms:                         ; preds = %bb_while_5_201_cond
  %r291 = getelementptr [256 x i32], ptr %r228, i32 0, i32 0
  %r292 = call i32 @stack_pop(ptr %r291)
  store i32 %r292, ptr %r290, align 4
  %r294 = getelementptr [256 x i32], ptr %r227, i32 0, i32 0
  %r295 = call i32 @stack_pop(ptr %r294)
  store i32 %r295, ptr %r293, align 4
  %r297 = getelementptr [256 x i32], ptr %r227, i32 0, i32 0
  %r298 = call i32 @stack_pop(ptr %r297)
  store i32 %r298, ptr %r296, align 4
  %r299 = getelementptr [256 x i32], ptr %r227, i32 0, i32 0
  %r300 = load i32, ptr %r290, align 4
  %r301 = load i32, ptr %r296, align 4
  %r302 = load i32, ptr %r293, align 4
  %r303 = call i32 @eval_op(i32 %r300, i32 %r301, i32 %r302)
  call void @stack_push(ptr %r299, i32 %r303)
  br label %bb_while_5_201_cond

bb_while_5_201_bre:                               ; preds = %bb_while_5_201_cond
  %r304 = getelementptr [256 x i32], ptr %r227, i32 0, i32 0
  %r305 = call i32 @stack_peek(ptr %r304)
  ret i32 %r305
}

define i32 @main() {
bb14:
  %r306 = alloca i32, align 4
  %r307 = call i32 @getint()
  store i32 %r307, ptr %r306, align 4
  %r308 = call i32 @getch()
  %r309 = call i32 @next_token()
  br label %bb_while_5_216_cond

bb_while_5_216_cond:                              ; preds = %bb_while_5_216_whilestms, %bb14
  %r310 = load i32, ptr %r306, align 4
  %r311 = icmp ne i32 %r310, 0
  br i1 %r311, label %bb_while_5_216_whilestms, label %bb_while_5_216_bre

bb_while_5_216_whilestms:                         ; preds = %bb_while_5_216_cond
  %r312 = call i32 @eval()
  call void @putint(i32 %r312)
  call void @putch(i32 10)
  %r313 = load i32, ptr %r306, align 4
  %r314 = sub i32 %r313, 1
  store i32 %r314, ptr %r306, align 4
  br label %bb_while_5_216_cond

bb_while_5_216_bre:                               ; preds = %bb_while_5_216_cond
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @before_main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %2

2:                                                ; preds = %18, %0
  %3 = load i32, ptr %1, align 4
  %4 = icmp slt i32 %3, 1024
  br i1 %4, label %5, label %21

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %7
  store i32 0, ptr %8, align 4
  %9 = load i32, ptr %1, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %10
  store i32 0, ptr %11, align 4
  %12 = load i32, ptr %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %13
  store i32 0, ptr %14, align 4
  %15 = load i32, ptr %1, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [1024 x i32], ptr @_sysy_h, i64 0, i64 %16
  store i32 0, ptr %17, align 4
  br label %18

18:                                               ; preds = %5
  %19 = load i32, ptr %1, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %1, align 4
  br label %2, !llvm.loop !6

21:                                               ; preds = %2
  store i32 1, ptr @_sysy_idx, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @after_main() #0 {
  %1 = alloca i32, align 4
  store i32 1, ptr %1, align 4
  br label %2

2:                                                ; preds = %63, %0
  %3 = load i32, ptr %1, align 4
  %4 = load i32, ptr @_sysy_idx, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %6, label %66

6:                                                ; preds = %2
  %7 = load ptr, ptr @stderr, align 8
  %8 = load i32, ptr %1, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [1024 x i32], ptr @_sysy_l1, i64 0, i64 %9
  %11 = load i32, ptr %10, align 4
  %12 = load i32, ptr %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [1024 x i32], ptr @_sysy_l2, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = load i32, ptr %1, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [1024 x i32], ptr @_sysy_h, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = load i32, ptr %1, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr %1, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = load i32, ptr %1, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef @.str.5, i32 noundef %11, i32 noundef %15, i32 noundef %19, i32 noundef %23, i32 noundef %27, i32 noundef %31)
  %33 = load i32, ptr %1, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = load i32, ptr @_sysy_us, align 16
  %38 = add nsw i32 %37, %36
  store i32 %38, ptr @_sysy_us, align 16
  %39 = load i32, ptr %1, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = load i32, ptr @_sysy_s, align 16
  %44 = add nsw i32 %43, %42
  store i32 %44, ptr @_sysy_s, align 16
  %45 = load i32, ptr @_sysy_us, align 16
  %46 = srem i32 %45, 1000000
  store i32 %46, ptr @_sysy_us, align 16
  %47 = load i32, ptr %1, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = load i32, ptr @_sysy_m, align 16
  %52 = add nsw i32 %51, %50
  store i32 %52, ptr @_sysy_m, align 16
  %53 = load i32, ptr @_sysy_s, align 16
  %54 = srem i32 %53, 60
  store i32 %54, ptr @_sysy_s, align 16
  %55 = load i32, ptr %1, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [1024 x i32], ptr @_sysy_h, i64 0, i64 %56
  %58 = load i32, ptr %57, align 4
  %59 = load i32, ptr @_sysy_h, align 16
  %60 = add nsw i32 %59, %58
  store i32 %60, ptr @_sysy_h, align 16
  %61 = load i32, ptr @_sysy_m, align 16
  %62 = srem i32 %61, 60
  store i32 %62, ptr @_sysy_m, align 16
  br label %63

63:                                               ; preds = %6
  %64 = load i32, ptr %1, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %1, align 4
  br label %2, !llvm.loop !8

66:                                               ; preds = %2
  %67 = load ptr, ptr @stderr, align 8
  %68 = load i32, ptr @_sysy_h, align 16
  %69 = load i32, ptr @_sysy_m, align 16
  %70 = load i32, ptr @_sysy_s, align 16
  %71 = load i32, ptr @_sysy_us, align 16
  %72 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %67, ptr noundef @.str.6, i32 noundef %68, i32 noundef %69, i32 noundef %70, i32 noundef %71)
  ret void
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getint() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %1)
  %3 = load i32, ptr %1, align 4
  ret i32 %3
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getch() #0 {
  %1 = alloca i8, align 1
  %2 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %1)
  %3 = load i8, ptr %1, align 1
  %4 = sext i8 %3 to i32
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getarray(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %3)
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %16, %1
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %19

10:                                               ; preds = %6
  %11 = load ptr, ptr %2, align 8
  %12 = load i32, ptr %4, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr %11, i64 %13
  %15 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %14)
  br label %16

16:                                               ; preds = %10
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %4, align 4
  br label %6, !llvm.loop !9

19:                                               ; preds = %6
  %20 = load i32, ptr %3, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putint(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %3)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putch(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putarray(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  %6 = load i32, ptr %3, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %6)
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %19, %2
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %22

12:                                               ; preds = %8
  %13 = load ptr, ptr %4, align 8
  %14 = load i32, ptr %5, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, ptr %13, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %17)
  br label %19

19:                                               ; preds = %12
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %5, align 4
  br label %8, !llvm.loop !10

22:                                               ; preds = %8
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_sysy_starttime(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = load i32, ptr @_sysy_idx, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [1024 x i32], ptr @_sysy_l1, i64 0, i64 %5
  store i32 %3, ptr %6, align 4
  %7 = call i32 @gettimeofday(ptr noundef @_sysy_start, ptr noundef null) #3
  ret void
}

; Function Attrs: nounwind
declare i32 @gettimeofday(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_sysy_stoptime(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = call i32 @gettimeofday(ptr noundef @_sysy_end, ptr noundef null) #3
  %4 = load i32, ptr %2, align 4
  %5 = load i32, ptr @_sysy_idx, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [1024 x i32], ptr @_sysy_l2, i64 0, i64 %6
  store i32 %4, ptr %7, align 4
  %8 = load i64, ptr @_sysy_end, align 8
  %9 = load i64, ptr @_sysy_start, align 8
  %10 = sub nsw i64 %8, %9
  %11 = mul nsw i64 1000000, %10
  %12 = load i64, ptr getelementptr inbounds (%struct.timeval, ptr @_sysy_end, i32 0, i32 1), align 8
  %13 = add nsw i64 %11, %12
  %14 = load i64, ptr getelementptr inbounds (%struct.timeval, ptr @_sysy_start, i32 0, i32 1), align 8
  %15 = sub nsw i64 %13, %14
  %16 = load i32, ptr @_sysy_idx, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = sext i32 %19 to i64
  %21 = add nsw i64 %20, %15
  %22 = trunc i64 %21 to i32
  store i32 %22, ptr %18, align 4
  %23 = load i32, ptr @_sysy_idx, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = sdiv i32 %26, 1000000
  %28 = load i32, ptr @_sysy_idx, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = add nsw i32 %31, %27
  store i32 %32, ptr %30, align 4
  %33 = load i32, ptr @_sysy_idx, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = srem i32 %36, 1000000
  store i32 %37, ptr %35, align 4
  %38 = load i32, ptr @_sysy_idx, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %39
  %41 = load i32, ptr %40, align 4
  %42 = sdiv i32 %41, 60
  %43 = load i32, ptr @_sysy_idx, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = add nsw i32 %46, %42
  store i32 %47, ptr %45, align 4
  %48 = load i32, ptr @_sysy_idx, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %49
  %51 = load i32, ptr %50, align 4
  %52 = srem i32 %51, 60
  store i32 %52, ptr %50, align 4
  %53 = load i32, ptr @_sysy_idx, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %54
  %56 = load i32, ptr %55, align 4
  %57 = sdiv i32 %56, 60
  %58 = load i32, ptr @_sysy_idx, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [1024 x i32], ptr @_sysy_h, i64 0, i64 %59
  %61 = load i32, ptr %60, align 4
  %62 = add nsw i32 %61, %57
  store i32 %62, ptr %60, align 4
  %63 = load i32, ptr @_sysy_idx, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = srem i32 %66, 60
  store i32 %67, ptr %65, align 4
  %68 = load i32, ptr @_sysy_idx, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr @_sysy_idx, align 4
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
