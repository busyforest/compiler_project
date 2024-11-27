; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }

@max = global i32 1073741824
@a = global [10000000 x i32] zeroinitializer
@b = global [10000000 x i32] zeroinitializer
@kernelid = global [10000 x i32] zeroinitializer
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

define i32 @checkrange(i32 %r100) {
bb1:
  %r101 = alloca i32, align 4
  store i32 %r100, ptr %r101, align 4
  br label %bb_while_5_10_cond

bb_while_5_10_cond:                               ; preds = %bb_while_5_10_whilestms, %bb1
  %r102 = load i32, ptr %r101, align 4
  %r103 = load i32, ptr @max, align 4
  %r104 = icmp sgt i32 %r102, %r103
  br i1 %r104, label %bb_while_5_10_whilestms, label %bb_while_5_10_bre

bb_while_5_10_whilestms:                          ; preds = %bb_while_5_10_cond
  %r105 = load i32, ptr %r101, align 4
  %r106 = load i32, ptr @max, align 4
  %r107 = sub i32 %r105, %r106
  store i32 %r107, ptr %r101, align 4
  br label %bb_while_5_10_cond

bb_while_5_10_bre:                                ; preds = %bb_while_5_10_cond
  br label %bb_while_5_11_cond

bb_while_5_11_cond:                               ; preds = %bb_while_5_11_whilestms, %bb_while_5_10_bre
  %r108 = load i32, ptr %r101, align 4
  %r109 = icmp slt i32 %r108, 0
  br i1 %r109, label %bb_while_5_11_whilestms, label %bb_while_5_11_bre

bb_while_5_11_whilestms:                          ; preds = %bb_while_5_11_cond
  %r110 = load i32, ptr %r101, align 4
  %r111 = load i32, ptr @max, align 4
  %r112 = add i32 %r110, %r111
  store i32 %r112, ptr %r101, align 4
  br label %bb_while_5_11_cond

bb_while_5_11_bre:                                ; preds = %bb_while_5_11_cond
  %r113 = load i32, ptr %r101, align 4
  ret i32 %r113
}

define i32 @mod(i32 %r114, i32 %r116) {
bb2:
  %r115 = alloca i32, align 4
  store i32 %r114, ptr %r115, align 4
  %r117 = alloca i32, align 4
  store i32 %r116, ptr %r117, align 4
  %r118 = load i32, ptr %r115, align 4
  %r119 = load i32, ptr %r115, align 4
  %r120 = load i32, ptr %r117, align 4
  %r121 = sdiv i32 %r119, %r120
  %r122 = load i32, ptr %r117, align 4
  %r123 = mul i32 %r121, %r122
  %r124 = sub i32 %r118, %r123
  ret i32 %r124
}

define i32 @reduce(i32 %r125, i32 %r127, i32 %r129) {
bb3:
  %r196 = alloca i32, align 4
  %r195 = alloca i32, align 4
  %r171 = alloca i32, align 4
  %r170 = alloca i32, align 4
  %r140 = alloca i32, align 4
  %r139 = alloca i32, align 4
  %r126 = alloca i32, align 4
  store i32 %r125, ptr %r126, align 4
  %r128 = alloca i32, align 4
  store i32 %r127, ptr %r128, align 4
  %r130 = alloca i32, align 4
  store i32 %r129, ptr %r130, align 4
  %r131 = load i32, ptr %r126, align 4
  %r132 = icmp eq i32 %r131, 0
  br i1 %r132, label %bb_if_5_19_true, label %bb_if_5_19_false

bb_if_5_19_true:                                  ; preds = %bb3
  %r133 = load i32, ptr %r128, align 4
  %r134 = load i32, ptr %r130, align 4
  %r135 = add i32 %r133, %r134
  %r136 = call i32 @checkrange(i32 %r135)
  ret i32 %r136

bb_if_5_19_false:                                 ; preds = %bb3
  br label %bb_if_5_19_end

bb_if_5_19_end:                                   ; preds = %bb_if_5_19_false
  %r137 = load i32, ptr %r126, align 4
  %r138 = icmp eq i32 %r137, 1
  br i1 %r138, label %bb_if_5_22_true, label %bb_if_5_22_false

bb_if_5_22_true:                                  ; preds = %bb_if_5_19_end
  store i32 0, ptr %r139, align 4
  store i32 1, ptr %r140, align 4
  br label %bb_while_9_26_cond

bb_while_9_26_cond:                               ; preds = %bb_if_13_27_end, %bb_if_5_22_true
  %r141 = load i32, ptr %r140, align 4
  %r142 = load i32, ptr @max, align 4
  %r143 = icmp slt i32 %r141, %r142
  br i1 %r143, label %bb_while_9_26_whilestms, label %bb_while_9_26_bre

bb_while_9_26_whilestms:                          ; preds = %bb_while_9_26_cond
  %r144 = load i32, ptr %r128, align 4
  %r145 = load i32, ptr %r140, align 4
  %r146 = sdiv i32 %r144, %r145
  %r147 = call i32 @mod(i32 %r146, i32 2)
  %r148 = load i32, ptr %r130, align 4
  %r149 = load i32, ptr %r140, align 4
  %r150 = sdiv i32 %r148, %r149
  %r151 = call i32 @mod(i32 %r150, i32 2)
  %r152 = icmp eq i32 %r147, %r151
  br i1 %r152, label %bb_if_13_27_true, label %bb_if_13_27_false

bb_if_13_27_true:                                 ; preds = %bb_while_9_26_whilestms
  %r153 = load i32, ptr %r139, align 4
  %r154 = mul i32 %r153, 2
  store i32 %r154, ptr %r139, align 4
  br label %bb_if_13_27_end

bb_if_13_27_false:                                ; preds = %bb_while_9_26_whilestms
  %r155 = load i32, ptr %r139, align 4
  %r156 = mul i32 %r155, 2
  %r157 = add i32 %r156, 1
  store i32 %r157, ptr %r139, align 4
  br label %bb_if_13_27_end

bb_if_13_27_end:                                  ; preds = %bb_if_13_27_false, %bb_if_13_27_true
  %r158 = load i32, ptr %r140, align 4
  %r159 = mul i32 %r158, 2
  store i32 %r159, ptr %r140, align 4
  br label %bb_while_9_26_cond

bb_while_9_26_bre:                                ; preds = %bb_while_9_26_cond
  %r160 = load i32, ptr %r139, align 4
  ret i32 %r160

bb_if_5_22_false:                                 ; preds = %bb_if_5_19_end
  br label %bb_if_5_22_end

bb_if_5_22_end:                                   ; preds = %bb_if_5_22_false
  %r161 = load i32, ptr %r126, align 4
  %r162 = icmp eq i32 %r161, 2
  br i1 %r162, label %bb_if_5_37_true, label %bb_if_5_37_false

bb_if_5_37_true:                                  ; preds = %bb_if_5_22_end
  %r163 = load i32, ptr %r128, align 4
  %r164 = load i32, ptr %r130, align 4
  %r165 = icmp sgt i32 %r163, %r164
  br i1 %r165, label %bb_if_9_38_true, label %bb_if_9_38_false

bb_if_9_38_true:                                  ; preds = %bb_if_5_37_true
  %r166 = load i32, ptr %r128, align 4
  ret i32 %r166

bb_if_9_38_false:                                 ; preds = %bb_if_5_37_true
  %r167 = load i32, ptr %r130, align 4
  ret i32 %r167

bb_if_9_38_end:                                   ; No predecessors!
  br label %bb_if_5_37_end

bb_if_5_37_false:                                 ; preds = %bb_if_5_22_end
  br label %bb_if_5_37_end

bb_if_5_37_end:                                   ; preds = %bb_if_5_37_false, %bb_if_9_38_end
  %r168 = load i32, ptr %r126, align 4
  %r169 = icmp eq i32 %r168, 3
  br i1 %r169, label %bb_if_5_41_true, label %bb_if_5_41_false

bb_if_5_41_true:                                  ; preds = %bb_if_5_37_end
  store i32 0, ptr %r170, align 4
  store i32 1, ptr %r171, align 4
  br label %bb_while_9_46_cond

bb_while_9_46_cond:                               ; preds = %bb_if_13_47_end, %bb_if_5_41_true
  %r172 = load i32, ptr %r171, align 4
  %r173 = load i32, ptr @max, align 4
  %r174 = icmp slt i32 %r172, %r173
  br i1 %r174, label %bb_while_9_46_whilestms, label %bb_while_9_46_bre

bb_while_9_46_whilestms:                          ; preds = %bb_while_9_46_cond
  %r175 = load i32, ptr %r128, align 4
  %r176 = load i32, ptr %r171, align 4
  %r177 = sdiv i32 %r175, %r176
  %r178 = call i32 @mod(i32 %r177, i32 2)
  %r179 = icmp eq i32 %r178, 1
  br i1 %r179, label %bb_if_13_47_true, label %bb39_47_next

bb39_47_next:                                     ; preds = %bb_while_9_46_whilestms
  %r180 = load i32, ptr %r130, align 4
  %r181 = load i32, ptr %r171, align 4
  %r182 = sdiv i32 %r180, %r181
  %r183 = call i32 @mod(i32 %r182, i32 2)
  %r184 = icmp eq i32 %r183, 1
  br i1 %r184, label %bb_if_13_47_true, label %bb_if_13_47_false

bb_if_13_47_true:                                 ; preds = %bb39_47_next, %bb_while_9_46_whilestms
  %r185 = load i32, ptr %r170, align 4
  %r186 = mul i32 %r185, 2
  %r187 = add i32 %r186, 1
  store i32 %r187, ptr %r170, align 4
  br label %bb_if_13_47_end

bb_if_13_47_false:                                ; preds = %bb39_47_next
  %r188 = load i32, ptr %r170, align 4
  %r189 = mul i32 %r188, 2
  store i32 %r189, ptr %r170, align 4
  br label %bb_if_13_47_end

bb_if_13_47_end:                                  ; preds = %bb_if_13_47_false, %bb_if_13_47_true
  %r190 = load i32, ptr %r171, align 4
  %r191 = mul i32 %r190, 2
  store i32 %r191, ptr %r171, align 4
  br label %bb_while_9_46_cond

bb_while_9_46_bre:                                ; preds = %bb_while_9_46_cond
  %r192 = load i32, ptr %r170, align 4
  ret i32 %r192

bb_if_5_41_false:                                 ; preds = %bb_if_5_37_end
  br label %bb_if_5_41_end

bb_if_5_41_end:                                   ; preds = %bb_if_5_41_false
  %r193 = load i32, ptr %r126, align 4
  %r194 = icmp eq i32 %r193, 4
  br i1 %r194, label %bb_if_5_57_true, label %bb_if_5_57_false

bb_if_5_57_true:                                  ; preds = %bb_if_5_41_end
  store i32 0, ptr %r195, align 4
  store i32 1, ptr %r196, align 4
  br label %bb_while_9_61_cond

bb_while_9_61_cond:                               ; preds = %bb_if_13_62_end, %bb_if_5_57_true
  %r197 = load i32, ptr %r196, align 4
  %r198 = load i32, ptr @max, align 4
  %r199 = icmp slt i32 %r197, %r198
  br i1 %r199, label %bb_while_9_61_whilestms, label %bb_while_9_61_bre

bb_while_9_61_whilestms:                          ; preds = %bb_while_9_61_cond
  %r200 = load i32, ptr %r128, align 4
  %r201 = load i32, ptr %r196, align 4
  %r202 = sdiv i32 %r200, %r201
  %r203 = call i32 @mod(i32 %r202, i32 2)
  %r204 = icmp eq i32 %r203, 1
  br i1 %r204, label %bb39_62_next, label %bb_if_13_62_false

bb39_62_next:                                     ; preds = %bb_while_9_61_whilestms
  %r205 = load i32, ptr %r130, align 4
  %r206 = load i32, ptr %r196, align 4
  %r207 = sdiv i32 %r205, %r206
  %r208 = call i32 @mod(i32 %r207, i32 2)
  %r209 = icmp eq i32 %r208, 1
  br i1 %r209, label %bb_if_13_62_true, label %bb_if_13_62_false

bb_if_13_62_true:                                 ; preds = %bb39_62_next
  %r210 = load i32, ptr %r195, align 4
  %r211 = mul i32 %r210, 2
  %r212 = add i32 %r211, 1
  store i32 %r212, ptr %r195, align 4
  br label %bb_if_13_62_end

bb_if_13_62_false:                                ; preds = %bb39_62_next, %bb_while_9_61_whilestms
  %r213 = load i32, ptr %r195, align 4
  %r214 = mul i32 %r213, 2
  store i32 %r214, ptr %r195, align 4
  br label %bb_if_13_62_end

bb_if_13_62_end:                                  ; preds = %bb_if_13_62_false, %bb_if_13_62_true
  %r215 = load i32, ptr %r196, align 4
  %r216 = mul i32 %r215, 2
  store i32 %r216, ptr %r196, align 4
  br label %bb_while_9_61_cond

bb_while_9_61_bre:                                ; preds = %bb_while_9_61_cond
  %r217 = load i32, ptr %r195, align 4
  ret i32 %r217

bb_if_5_57_false:                                 ; preds = %bb_if_5_41_end
  br label %bb_if_5_57_end

bb_if_5_57_end:                                   ; preds = %bb_if_5_57_false
  ret i32 0
}

define i32 @getvalue(ptr %r218, i32 %r219, i32 %r221, i32 %r223, i32 %r225) {
bb4:
  %r237 = alloca i32, align 4
  %r220 = alloca i32, align 4
  store i32 %r219, ptr %r220, align 4
  %r222 = alloca i32, align 4
  store i32 %r221, ptr %r222, align 4
  %r224 = alloca i32, align 4
  store i32 %r223, ptr %r224, align 4
  %r226 = alloca i32, align 4
  store i32 %r225, ptr %r226, align 4
  %r227 = load i32, ptr %r224, align 4
  %r228 = icmp slt i32 %r227, 0
  br i1 %r228, label %bb_if_5_76_true, label %bb21_76_next

bb21_76_next:                                     ; preds = %bb4
  %r229 = load i32, ptr %r226, align 4
  %r230 = icmp slt i32 %r229, 0
  br i1 %r230, label %bb_if_5_76_true, label %bb32_76_next

bb32_76_next:                                     ; preds = %bb21_76_next
  %r231 = load i32, ptr %r224, align 4
  %r232 = load i32, ptr %r220, align 4
  %r233 = icmp sge i32 %r231, %r232
  br i1 %r233, label %bb_if_5_76_true, label %bb44_76_next

bb44_76_next:                                     ; preds = %bb32_76_next
  %r234 = load i32, ptr %r226, align 4
  %r235 = load i32, ptr %r222, align 4
  %r236 = icmp sge i32 %r234, %r235
  br i1 %r236, label %bb_if_5_76_true, label %bb_if_5_76_false

bb_if_5_76_true:                                  ; preds = %bb44_76_next, %bb32_76_next, %bb21_76_next, %bb4
  ret i32 0

bb_if_5_76_false:                                 ; preds = %bb44_76_next
  br label %bb_if_5_76_end

bb_if_5_76_end:                                   ; preds = %bb_if_5_76_false
  %r238 = load i32, ptr %r224, align 4
  %r239 = load i32, ptr %r222, align 4
  %r240 = mul i32 %r238, %r239
  %r241 = load i32, ptr %r226, align 4
  %r242 = add i32 %r240, %r241
  store i32 %r242, ptr %r237, align 4
  %r243 = load i32, ptr %r237, align 4
  %r244 = getelementptr i32, ptr %r218, i32 %r243
  %r245 = load i32, ptr %r244, align 4
  ret i32 %r245
}

define i32 @convn(i32 %r246, ptr %r248, ptr %r249, i32 %r250, i32 %r252, i32 %r254) {
bb5:
  %r306 = alloca i32, align 4
  %r247 = alloca i32, align 4
  store i32 %r246, ptr %r247, align 4
  %r251 = alloca i32, align 4
  store i32 %r250, ptr %r251, align 4
  %r253 = alloca i32, align 4
  store i32 %r252, ptr %r253, align 4
  %r255 = alloca i32, align 4
  store i32 %r254, ptr %r255, align 4
  %r256 = alloca i32, align 4
  store i32 0, ptr %r256, align 4
  %r257 = alloca i32, align 4
  store i32 0, ptr %r257, align 4
  %r258 = alloca i32, align 4
  %r259 = alloca i32, align 4
  %r260 = alloca i32, align 4
  %r261 = alloca i32, align 4
  store i32 1, ptr %r261, align 4
  br label %bb_while_5_88_cond

bb_while_5_88_cond:                               ; preds = %bb_if_9_109_end, %bb5
  %r262 = load i32, ptr %r261, align 4
  %r263 = load i32, ptr %r261, align 4
  %r264 = icmp eq i32 %r262, %r263
  br i1 %r264, label %bb_while_5_88_whilestms, label %bb_while_5_88_bre

bb_while_5_88_whilestms:                          ; preds = %bb_while_5_88_cond
  store i32 0, ptr %r257, align 4
  br label %bb_while_9_90_cond

bb_while_9_90_cond:                               ; preds = %bb_if_13_106_end, %bb_while_5_88_whilestms
  %r265 = load i32, ptr %r261, align 4
  %r266 = load i32, ptr %r261, align 4
  %r267 = icmp eq i32 %r265, %r266
  br i1 %r267, label %bb_while_9_90_whilestms, label %bb_while_9_90_bre

bb_while_9_90_whilestms:                          ; preds = %bb_while_9_90_cond
  store i32 0, ptr %r260, align 4
  %r268 = load i32, ptr %r256, align 4
  %r269 = load i32, ptr %r255, align 4
  %r270 = sdiv i32 %r269, 2
  %r271 = sub i32 %r268, %r270
  store i32 %r271, ptr %r258, align 4
  br label %bb_while_13_93_cond

bb_while_13_93_cond:                              ; preds = %bb_if_17_101_end, %bb_while_9_90_whilestms
  %r272 = load i32, ptr %r261, align 4
  %r273 = load i32, ptr %r261, align 4
  %r274 = icmp eq i32 %r272, %r273
  br i1 %r274, label %bb_while_13_93_whilestms, label %bb_while_13_93_bre

bb_while_13_93_whilestms:                         ; preds = %bb_while_13_93_cond
  %r275 = load i32, ptr %r257, align 4
  %r276 = load i32, ptr %r255, align 4
  %r277 = sdiv i32 %r276, 2
  %r278 = sub i32 %r275, %r277
  store i32 %r278, ptr %r259, align 4
  br label %bb_while_17_95_cond

bb_while_17_95_cond:                              ; preds = %bb_if_21_98_end, %bb_while_13_93_whilestms
  %r279 = load i32, ptr %r261, align 4
  %r280 = load i32, ptr %r261, align 4
  %r281 = icmp eq i32 %r279, %r280
  br i1 %r281, label %bb_while_17_95_whilestms, label %bb_while_17_95_bre

bb_while_17_95_whilestms:                         ; preds = %bb_while_17_95_cond
  %r282 = load i32, ptr %r247, align 4
  %r283 = load i32, ptr %r260, align 4
  %r284 = load i32, ptr %r251, align 4
  %r285 = load i32, ptr %r253, align 4
  %r286 = load i32, ptr %r258, align 4
  %r287 = load i32, ptr %r259, align 4
  %r288 = call i32 @getvalue(ptr %r248, i32 %r284, i32 %r285, i32 %r286, i32 %r287)
  %r289 = call i32 @reduce(i32 %r282, i32 %r283, i32 %r288)
  store i32 %r289, ptr %r260, align 4
  %r290 = load i32, ptr %r259, align 4
  %r291 = add i32 %r290, 1
  store i32 %r291, ptr %r259, align 4
  %r292 = load i32, ptr %r259, align 4
  %r293 = load i32, ptr %r257, align 4
  %r294 = load i32, ptr %r255, align 4
  %r295 = sdiv i32 %r294, 2
  %r296 = add i32 %r293, %r295
  %r297 = icmp sge i32 %r292, %r296
  br i1 %r297, label %bb_if_21_98_true, label %bb_if_21_98_false

bb_if_21_98_true:                                 ; preds = %bb_while_17_95_whilestms
  br label %bb_while_17_95_bre

bb_if_21_98_false:                                ; preds = %bb_while_17_95_whilestms
  br label %bb_if_21_98_end

bb_if_21_98_end:                                  ; preds = %bb_if_21_98_false
  br label %bb_while_17_95_cond

bb_while_17_95_bre:                               ; preds = %bb_if_21_98_true, %bb_while_17_95_cond
  %r298 = load i32, ptr %r258, align 4
  %r299 = add i32 %r298, 1
  store i32 %r299, ptr %r258, align 4
  %r300 = load i32, ptr %r258, align 4
  %r301 = load i32, ptr %r256, align 4
  %r302 = load i32, ptr %r255, align 4
  %r303 = sdiv i32 %r302, 2
  %r304 = add i32 %r301, %r303
  %r305 = icmp sge i32 %r300, %r304
  br i1 %r305, label %bb_if_17_101_true, label %bb_if_17_101_false

bb_if_17_101_true:                                ; preds = %bb_while_17_95_bre
  br label %bb_while_13_93_bre

bb_if_17_101_false:                               ; preds = %bb_while_17_95_bre
  br label %bb_if_17_101_end

bb_if_17_101_end:                                 ; preds = %bb_if_17_101_false
  br label %bb_while_13_93_cond

bb_while_13_93_bre:                               ; preds = %bb_if_17_101_true, %bb_while_13_93_cond
  %r307 = load i32, ptr %r256, align 4
  %r308 = load i32, ptr %r253, align 4
  %r309 = mul i32 %r307, %r308
  %r310 = load i32, ptr %r257, align 4
  %r311 = add i32 %r309, %r310
  store i32 %r311, ptr %r306, align 4
  %r312 = load i32, ptr %r306, align 4
  %r313 = getelementptr i32, ptr %r249, i32 %r312
  %r314 = load i32, ptr %r260, align 4
  store i32 %r314, ptr %r313, align 4
  %r315 = load i32, ptr %r257, align 4
  %r316 = add i32 %r315, 1
  store i32 %r316, ptr %r257, align 4
  %r317 = load i32, ptr %r257, align 4
  %r318 = load i32, ptr %r253, align 4
  %r319 = icmp sge i32 %r317, %r318
  br i1 %r319, label %bb_if_13_106_true, label %bb_if_13_106_false

bb_if_13_106_true:                                ; preds = %bb_while_13_93_bre
  br label %bb_while_9_90_bre

bb_if_13_106_false:                               ; preds = %bb_while_13_93_bre
  br label %bb_if_13_106_end

bb_if_13_106_end:                                 ; preds = %bb_if_13_106_false
  br label %bb_while_9_90_cond

bb_while_9_90_bre:                                ; preds = %bb_if_13_106_true, %bb_while_9_90_cond
  %r320 = load i32, ptr %r256, align 4
  %r321 = add i32 %r320, 1
  store i32 %r321, ptr %r256, align 4
  %r322 = load i32, ptr %r256, align 4
  %r323 = load i32, ptr %r251, align 4
  %r324 = icmp sge i32 %r322, %r323
  br i1 %r324, label %bb_if_9_109_true, label %bb_if_9_109_false

bb_if_9_109_true:                                 ; preds = %bb_while_9_90_bre
  br label %bb_while_5_88_bre

bb_if_9_109_false:                                ; preds = %bb_while_9_90_bre
  br label %bb_if_9_109_end

bb_if_9_109_end:                                  ; preds = %bb_if_9_109_false
  br label %bb_while_5_88_cond

bb_while_5_88_bre:                                ; preds = %bb_if_9_109_true, %bb_while_5_88_cond
  ret i32 0
}

define void @memmove(ptr %r325, ptr %r326, i32 %r327) {
bb6:
  %r328 = alloca i32, align 4
  store i32 %r327, ptr %r328, align 4
  %r329 = alloca i32, align 4
  store i32 0, ptr %r329, align 4
  br label %bb_while_5_120_cond

bb_while_5_120_cond:                              ; preds = %bb_while_5_120_whilestms, %bb6
  %r330 = load i32, ptr %r329, align 4
  %r331 = load i32, ptr %r328, align 4
  %r332 = icmp slt i32 %r330, %r331
  br i1 %r332, label %bb_while_5_120_whilestms, label %bb_while_5_120_bre

bb_while_5_120_whilestms:                         ; preds = %bb_while_5_120_cond
  %r333 = load i32, ptr %r329, align 4
  %r334 = getelementptr i32, ptr %r325, i32 %r333
  %r335 = load i32, ptr %r329, align 4
  %r336 = getelementptr i32, ptr %r326, i32 %r335
  %r337 = load i32, ptr %r336, align 4
  store i32 %r337, ptr %r334, align 4
  %r338 = load i32, ptr %r329, align 4
  %r339 = add i32 %r338, 1
  store i32 %r339, ptr %r329, align 4
  br label %bb_while_5_120_cond

bb_while_5_120_bre:                               ; preds = %bb_while_5_120_cond
  ret void
}

define i32 @main() {
bb7:
  %r368 = alloca i32, align 4
  %r366 = alloca i32, align 4
  %r340 = alloca i32, align 4
  %r341 = call i32 @getint()
  store i32 %r341, ptr %r340, align 4
  %r342 = alloca i32, align 4
  %r343 = call i32 @getint()
  store i32 %r343, ptr %r342, align 4
  %r344 = alloca i32, align 4
  %r345 = call i32 @getint()
  store i32 %r345, ptr %r344, align 4
  %r346 = alloca i32, align 4
  %r347 = call i32 @getint()
  store i32 %r347, ptr %r346, align 4
  %r348 = alloca i32, align 4
  store i32 0, ptr %r348, align 4
  br label %bb_while_5_133_cond

bb_while_5_133_cond:                              ; preds = %bb_while_5_133_whilestms, %bb7
  %r349 = load i32, ptr %r348, align 4
  %r350 = load i32, ptr %r346, align 4
  %r351 = icmp slt i32 %r349, %r350
  br i1 %r351, label %bb_while_5_133_whilestms, label %bb_while_5_133_bre

bb_while_5_133_whilestms:                         ; preds = %bb_while_5_133_cond
  %r352 = load i32, ptr %r348, align 4
  %r353 = getelementptr [10000000 x i32], ptr @a, i32 0, i32 %r352
  %r354 = call i32 @getint()
  store i32 %r354, ptr %r353, align 4
  %r355 = load i32, ptr %r348, align 4
  %r356 = add i32 %r355, 1
  store i32 %r356, ptr %r348, align 4
  br label %bb_while_5_133_cond

bb_while_5_133_bre:                               ; preds = %bb_while_5_133_cond
  %r357 = call i32 @getint()
  store i32 %r357, ptr %r346, align 4
  store i32 0, ptr %r348, align 4
  br label %bb_while_5_139_cond

bb_while_5_139_cond:                              ; preds = %bb_while_5_139_whilestms, %bb_while_5_133_bre
  %r358 = load i32, ptr %r348, align 4
  %r359 = load i32, ptr %r346, align 4
  %r360 = icmp slt i32 %r358, %r359
  br i1 %r360, label %bb_while_5_139_whilestms, label %bb_while_5_139_bre

bb_while_5_139_whilestms:                         ; preds = %bb_while_5_139_cond
  %r361 = load i32, ptr %r348, align 4
  %r362 = getelementptr [10000 x i32], ptr @kernelid, i32 0, i32 %r361
  %r363 = call i32 @getint()
  store i32 %r363, ptr %r362, align 4
  %r364 = load i32, ptr %r348, align 4
  %r365 = add i32 %r364, 1
  store i32 %r365, ptr %r348, align 4
  br label %bb_while_5_139_cond

bb_while_5_139_bre:                               ; preds = %bb_while_5_139_cond
  %r367 = load i32, ptr %r346, align 4
  store i32 %r367, ptr %r366, align 4
  call void @_sysy_starttime(i32 209)
  store i32 0, ptr %r368, align 4
  br label %bb_while_5_147_cond

bb_while_5_147_cond:                              ; preds = %bb_while_5_147_whilestms, %bb_while_5_139_bre
  %r369 = load i32, ptr %r368, align 4
  %r370 = load i32, ptr %r366, align 4
  %r371 = icmp slt i32 %r369, %r370
  br i1 %r371, label %bb_while_5_147_whilestms, label %bb_while_5_147_bre

bb_while_5_147_whilestms:                         ; preds = %bb_while_5_147_cond
  %r372 = load i32, ptr %r368, align 4
  %r373 = getelementptr [10000 x i32], ptr @kernelid, i32 0, i32 %r372
  %r374 = load i32, ptr %r373, align 4
  %r375 = getelementptr [10000000 x i32], ptr @a, i32 0, i32 0
  %r376 = getelementptr [10000000 x i32], ptr @b, i32 0, i32 0
  %r377 = load i32, ptr %r342, align 4
  %r378 = load i32, ptr %r344, align 4
  %r379 = load i32, ptr %r340, align 4
  %r380 = call i32 @convn(i32 %r374, ptr %r375, ptr %r376, i32 %r377, i32 %r378, i32 %r379)
  %r381 = getelementptr [10000000 x i32], ptr @a, i32 0, i32 0
  %r382 = getelementptr [10000000 x i32], ptr @b, i32 0, i32 0
  %r383 = load i32, ptr %r342, align 4
  %r384 = load i32, ptr %r344, align 4
  %r385 = mul i32 %r383, %r384
  call void @memmove(ptr %r381, ptr %r382, i32 %r385)
  %r386 = load i32, ptr %r368, align 4
  %r387 = add i32 %r386, 1
  store i32 %r387, ptr %r368, align 4
  br label %bb_while_5_147_cond

bb_while_5_147_bre:                               ; preds = %bb_while_5_147_cond
  call void @_sysy_stoptime(i32 312)
  %r388 = load i32, ptr %r342, align 4
  %r389 = load i32, ptr %r344, align 4
  %r390 = mul i32 %r388, %r389
  %r391 = getelementptr [10000000 x i32], ptr @a, i32 0, i32 0
  call void @putarray(i32 %r390, ptr %r391)
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
