
C
global_step/initial_valueConst*
value	B : *
dtype0
W
global_step
VariableV2*
dtype0*
shared_name *
shape: *
	container 

global_step/AssignAssignglobal_stepglobal_step/initial_value*
T0*
use_locking(*
validate_shape(*
_class
loc:@global_step
R
global_step/readIdentityglobal_step*
T0*
_class
loc:@global_step
/
Add/yConst*
value	B :*
dtype0
,
AddAddglobal_step/readAdd/y*
T0
t
AssignAssignglobal_stepAdd*
T0*
use_locking(*
validate_shape(*
_class
loc:@global_step
5

batch_sizePlaceholder*
dtype0*
shape:
:
sequence_lengthPlaceholder*
dtype0*
shape:
;
masksPlaceholder*
dtype0*
shape:ÿÿÿÿÿÿÿÿÿ
+
CastCastmasks*

DstT0*

SrcT0
M
#is_continuous_control/initial_valueConst*
value	B :*
dtype0
a
is_continuous_control
VariableV2*
dtype0*
shared_name *
shape: *
	container 
¾
is_continuous_control/AssignAssignis_continuous_control#is_continuous_control/initial_value*
T0*
use_locking(*
validate_shape(*(
_class
loc:@is_continuous_control
p
is_continuous_control/readIdentityis_continuous_control*
T0*(
_class
loc:@is_continuous_control
F
version_number/initial_valueConst*
value	B :*
dtype0
Z
version_number
VariableV2*
dtype0*
shared_name *
shape: *
	container 
¢
version_number/AssignAssignversion_numberversion_number/initial_value*
T0*
use_locking(*
validate_shape(*!
_class
loc:@version_number
[
version_number/readIdentityversion_number*
T0*!
_class
loc:@version_number
C
memory_size/initial_valueConst*
value	B : *
dtype0
W
memory_size
VariableV2*
dtype0*
shared_name *
shape: *
	container 

memory_size/AssignAssignmemory_sizememory_size/initial_value*
T0*
use_locking(*
validate_shape(*
_class
loc:@memory_size
R
memory_size/readIdentitymemory_size*
T0*
_class
loc:@memory_size
K
!action_output_shape/initial_valueConst*
value	B :	*
dtype0
_
action_output_shape
VariableV2*
dtype0*
shared_name *
shape: *
	container 
¶
action_output_shape/AssignAssignaction_output_shape!action_output_shape/initial_value*
T0*
use_locking(*
validate_shape(*&
_class
loc:@action_output_shape
j
action_output_shape/readIdentityaction_output_shape*
T0*&
_class
loc:@action_output_shape
L
vector_observationPlaceholder*
dtype0*
shape:ÿÿÿÿÿÿÿÿÿ
¥
?main_graph_0/hidden_0/kernel/Initializer/truncated_normal/shapeConst*
valueB"   @   *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel

>main_graph_0/hidden_0/kernel/Initializer/truncated_normal/meanConst*
valueB
 *    *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel

@main_graph_0/hidden_0/kernel/Initializer/truncated_normal/stddevConst*
valueB
 *à>*
dtype0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
þ
Imain_graph_0/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal?main_graph_0/hidden_0/kernel/Initializer/truncated_normal/shape*
T0*
dtype0*
seed2*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
seed

=main_graph_0/hidden_0/kernel/Initializer/truncated_normal/mulMulImain_graph_0/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormal@main_graph_0/hidden_0/kernel/Initializer/truncated_normal/stddev*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
ù
9main_graph_0/hidden_0/kernel/Initializer/truncated_normalAdd=main_graph_0/hidden_0/kernel/Initializer/truncated_normal/mul>main_graph_0/hidden_0/kernel/Initializer/truncated_normal/mean*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
¡
main_graph_0/hidden_0/kernel
VariableV2*
dtype0*
shared_name *
shape
:@*
	container */
_class%
#!loc:@main_graph_0/hidden_0/kernel
é
#main_graph_0/hidden_0/kernel/AssignAssignmain_graph_0/hidden_0/kernel9main_graph_0/hidden_0/kernel/Initializer/truncated_normal*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_0/kernel

!main_graph_0/hidden_0/kernel/readIdentitymain_graph_0/hidden_0/kernel*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel

<main_graph_0/hidden_0/bias/Initializer/zeros/shape_as_tensorConst*
valueB:@*
dtype0*-
_class#
!loc:@main_graph_0/hidden_0/bias

2main_graph_0/hidden_0/bias/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*-
_class#
!loc:@main_graph_0/hidden_0/bias
ð
,main_graph_0/hidden_0/bias/Initializer/zerosFill<main_graph_0/hidden_0/bias/Initializer/zeros/shape_as_tensor2main_graph_0/hidden_0/bias/Initializer/zeros/Const*
T0*

index_type0*-
_class#
!loc:@main_graph_0/hidden_0/bias

main_graph_0/hidden_0/bias
VariableV2*
dtype0*
shared_name *
shape:@*
	container *-
_class#
!loc:@main_graph_0/hidden_0/bias
Ö
!main_graph_0/hidden_0/bias/AssignAssignmain_graph_0/hidden_0/bias,main_graph_0/hidden_0/bias/Initializer/zeros*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_0/bias

main_graph_0/hidden_0/bias/readIdentitymain_graph_0/hidden_0/bias*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias

main_graph_0/hidden_0/MatMulMatMulvector_observation!main_graph_0/hidden_0/kernel/read*
transpose_b( *
T0*
transpose_a( 

main_graph_0/hidden_0/BiasAddBiasAddmain_graph_0/hidden_0/MatMulmain_graph_0/hidden_0/bias/read*
T0*
data_formatNHWC
P
main_graph_0/hidden_0/SigmoidSigmoidmain_graph_0/hidden_0/BiasAdd*
T0
g
main_graph_0/hidden_0/MulMulmain_graph_0/hidden_0/BiasAddmain_graph_0/hidden_0/Sigmoid*
T0
¥
?main_graph_0/hidden_1/kernel/Initializer/truncated_normal/shapeConst*
valueB"@   @   *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel

>main_graph_0/hidden_1/kernel/Initializer/truncated_normal/meanConst*
valueB
 *    *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel

@main_graph_0/hidden_1/kernel/Initializer/truncated_normal/stddevConst*
valueB
 *Eñ>*
dtype0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
þ
Imain_graph_0/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal?main_graph_0/hidden_1/kernel/Initializer/truncated_normal/shape*
T0*
dtype0*
seed22*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
seed

=main_graph_0/hidden_1/kernel/Initializer/truncated_normal/mulMulImain_graph_0/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormal@main_graph_0/hidden_1/kernel/Initializer/truncated_normal/stddev*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
ù
9main_graph_0/hidden_1/kernel/Initializer/truncated_normalAdd=main_graph_0/hidden_1/kernel/Initializer/truncated_normal/mul>main_graph_0/hidden_1/kernel/Initializer/truncated_normal/mean*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
¡
main_graph_0/hidden_1/kernel
VariableV2*
dtype0*
shared_name *
shape
:@@*
	container */
_class%
#!loc:@main_graph_0/hidden_1/kernel
é
#main_graph_0/hidden_1/kernel/AssignAssignmain_graph_0/hidden_1/kernel9main_graph_0/hidden_1/kernel/Initializer/truncated_normal*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_1/kernel

!main_graph_0/hidden_1/kernel/readIdentitymain_graph_0/hidden_1/kernel*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel

<main_graph_0/hidden_1/bias/Initializer/zeros/shape_as_tensorConst*
valueB:@*
dtype0*-
_class#
!loc:@main_graph_0/hidden_1/bias

2main_graph_0/hidden_1/bias/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*-
_class#
!loc:@main_graph_0/hidden_1/bias
ð
,main_graph_0/hidden_1/bias/Initializer/zerosFill<main_graph_0/hidden_1/bias/Initializer/zeros/shape_as_tensor2main_graph_0/hidden_1/bias/Initializer/zeros/Const*
T0*

index_type0*-
_class#
!loc:@main_graph_0/hidden_1/bias

main_graph_0/hidden_1/bias
VariableV2*
dtype0*
shared_name *
shape:@*
	container *-
_class#
!loc:@main_graph_0/hidden_1/bias
Ö
!main_graph_0/hidden_1/bias/AssignAssignmain_graph_0/hidden_1/bias,main_graph_0/hidden_1/bias/Initializer/zeros*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_1/bias

main_graph_0/hidden_1/bias/readIdentitymain_graph_0/hidden_1/bias*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias

main_graph_0/hidden_1/MatMulMatMulmain_graph_0/hidden_0/Mul!main_graph_0/hidden_1/kernel/read*
transpose_b( *
T0*
transpose_a( 

main_graph_0/hidden_1/BiasAddBiasAddmain_graph_0/hidden_1/MatMulmain_graph_0/hidden_1/bias/read*
T0*
data_formatNHWC
P
main_graph_0/hidden_1/SigmoidSigmoidmain_graph_0/hidden_1/BiasAdd*
T0
g
main_graph_0/hidden_1/MulMulmain_graph_0/hidden_1/BiasAddmain_graph_0/hidden_1/Sigmoid*
T0
¥
?main_graph_0/hidden_2/kernel/Initializer/truncated_normal/shapeConst*
valueB"@   @   *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel

>main_graph_0/hidden_2/kernel/Initializer/truncated_normal/meanConst*
valueB
 *    *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel

@main_graph_0/hidden_2/kernel/Initializer/truncated_normal/stddevConst*
valueB
 *Eñ>*
dtype0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel
þ
Imain_graph_0/hidden_2/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal?main_graph_0/hidden_2/kernel/Initializer/truncated_normal/shape*
T0*
dtype0*
seed2E*/
_class%
#!loc:@main_graph_0/hidden_2/kernel*
seed

=main_graph_0/hidden_2/kernel/Initializer/truncated_normal/mulMulImain_graph_0/hidden_2/kernel/Initializer/truncated_normal/TruncatedNormal@main_graph_0/hidden_2/kernel/Initializer/truncated_normal/stddev*
T0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel
ù
9main_graph_0/hidden_2/kernel/Initializer/truncated_normalAdd=main_graph_0/hidden_2/kernel/Initializer/truncated_normal/mul>main_graph_0/hidden_2/kernel/Initializer/truncated_normal/mean*
T0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel
¡
main_graph_0/hidden_2/kernel
VariableV2*
dtype0*
shared_name *
shape
:@@*
	container */
_class%
#!loc:@main_graph_0/hidden_2/kernel
é
#main_graph_0/hidden_2/kernel/AssignAssignmain_graph_0/hidden_2/kernel9main_graph_0/hidden_2/kernel/Initializer/truncated_normal*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_2/kernel

!main_graph_0/hidden_2/kernel/readIdentitymain_graph_0/hidden_2/kernel*
T0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel

<main_graph_0/hidden_2/bias/Initializer/zeros/shape_as_tensorConst*
valueB:@*
dtype0*-
_class#
!loc:@main_graph_0/hidden_2/bias

2main_graph_0/hidden_2/bias/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*-
_class#
!loc:@main_graph_0/hidden_2/bias
ð
,main_graph_0/hidden_2/bias/Initializer/zerosFill<main_graph_0/hidden_2/bias/Initializer/zeros/shape_as_tensor2main_graph_0/hidden_2/bias/Initializer/zeros/Const*
T0*

index_type0*-
_class#
!loc:@main_graph_0/hidden_2/bias

main_graph_0/hidden_2/bias
VariableV2*
dtype0*
shared_name *
shape:@*
	container *-
_class#
!loc:@main_graph_0/hidden_2/bias
Ö
!main_graph_0/hidden_2/bias/AssignAssignmain_graph_0/hidden_2/bias,main_graph_0/hidden_2/bias/Initializer/zeros*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_2/bias

main_graph_0/hidden_2/bias/readIdentitymain_graph_0/hidden_2/bias*
T0*-
_class#
!loc:@main_graph_0/hidden_2/bias

main_graph_0/hidden_2/MatMulMatMulmain_graph_0/hidden_1/Mul!main_graph_0/hidden_2/kernel/read*
transpose_b( *
T0*
transpose_a( 

main_graph_0/hidden_2/BiasAddBiasAddmain_graph_0/hidden_2/MatMulmain_graph_0/hidden_2/bias/read*
T0*
data_formatNHWC
P
main_graph_0/hidden_2/SigmoidSigmoidmain_graph_0/hidden_2/BiasAdd*
T0
g
main_graph_0/hidden_2/MulMulmain_graph_0/hidden_2/BiasAddmain_graph_0/hidden_2/Sigmoid*
T0
¥
?main_graph_0/hidden_3/kernel/Initializer/truncated_normal/shapeConst*
valueB"@   @   *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel

>main_graph_0/hidden_3/kernel/Initializer/truncated_normal/meanConst*
valueB
 *    *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel

@main_graph_0/hidden_3/kernel/Initializer/truncated_normal/stddevConst*
valueB
 *Eñ>*
dtype0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel
þ
Imain_graph_0/hidden_3/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal?main_graph_0/hidden_3/kernel/Initializer/truncated_normal/shape*
T0*
dtype0*
seed2X*/
_class%
#!loc:@main_graph_0/hidden_3/kernel*
seed

=main_graph_0/hidden_3/kernel/Initializer/truncated_normal/mulMulImain_graph_0/hidden_3/kernel/Initializer/truncated_normal/TruncatedNormal@main_graph_0/hidden_3/kernel/Initializer/truncated_normal/stddev*
T0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel
ù
9main_graph_0/hidden_3/kernel/Initializer/truncated_normalAdd=main_graph_0/hidden_3/kernel/Initializer/truncated_normal/mul>main_graph_0/hidden_3/kernel/Initializer/truncated_normal/mean*
T0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel
¡
main_graph_0/hidden_3/kernel
VariableV2*
dtype0*
shared_name *
shape
:@@*
	container */
_class%
#!loc:@main_graph_0/hidden_3/kernel
é
#main_graph_0/hidden_3/kernel/AssignAssignmain_graph_0/hidden_3/kernel9main_graph_0/hidden_3/kernel/Initializer/truncated_normal*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_3/kernel

!main_graph_0/hidden_3/kernel/readIdentitymain_graph_0/hidden_3/kernel*
T0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel

<main_graph_0/hidden_3/bias/Initializer/zeros/shape_as_tensorConst*
valueB:@*
dtype0*-
_class#
!loc:@main_graph_0/hidden_3/bias

2main_graph_0/hidden_3/bias/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*-
_class#
!loc:@main_graph_0/hidden_3/bias
ð
,main_graph_0/hidden_3/bias/Initializer/zerosFill<main_graph_0/hidden_3/bias/Initializer/zeros/shape_as_tensor2main_graph_0/hidden_3/bias/Initializer/zeros/Const*
T0*

index_type0*-
_class#
!loc:@main_graph_0/hidden_3/bias

main_graph_0/hidden_3/bias
VariableV2*
dtype0*
shared_name *
shape:@*
	container *-
_class#
!loc:@main_graph_0/hidden_3/bias
Ö
!main_graph_0/hidden_3/bias/AssignAssignmain_graph_0/hidden_3/bias,main_graph_0/hidden_3/bias/Initializer/zeros*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_3/bias

main_graph_0/hidden_3/bias/readIdentitymain_graph_0/hidden_3/bias*
T0*-
_class#
!loc:@main_graph_0/hidden_3/bias

main_graph_0/hidden_3/MatMulMatMulmain_graph_0/hidden_2/Mul!main_graph_0/hidden_3/kernel/read*
transpose_b( *
T0*
transpose_a( 

main_graph_0/hidden_3/BiasAddBiasAddmain_graph_0/hidden_3/MatMulmain_graph_0/hidden_3/bias/read*
T0*
data_formatNHWC
P
main_graph_0/hidden_3/SigmoidSigmoidmain_graph_0/hidden_3/BiasAdd*
T0
g
main_graph_0/hidden_3/MulMulmain_graph_0/hidden_3/BiasAddmain_graph_0/hidden_3/Sigmoid*
T0
5
dropout_ratePlaceholder*
dtype0*
shape: 
@
dropout/IdentityIdentitymain_graph_0/hidden_3/Mul*
T0

4pre_action/kernel/Initializer/truncated_normal/shapeConst*
valueB"@   	   *
dtype0*$
_class
loc:@pre_action/kernel

3pre_action/kernel/Initializer/truncated_normal/meanConst*
valueB
 *    *
dtype0*$
_class
loc:@pre_action/kernel

5pre_action/kernel/Initializer/truncated_normal/stddevConst*
valueB
 *i<*
dtype0*$
_class
loc:@pre_action/kernel
Ý
>pre_action/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal4pre_action/kernel/Initializer/truncated_normal/shape*
T0*
dtype0*
seed2m*$
_class
loc:@pre_action/kernel*
seed
ß
2pre_action/kernel/Initializer/truncated_normal/mulMul>pre_action/kernel/Initializer/truncated_normal/TruncatedNormal5pre_action/kernel/Initializer/truncated_normal/stddev*
T0*$
_class
loc:@pre_action/kernel
Í
.pre_action/kernel/Initializer/truncated_normalAdd2pre_action/kernel/Initializer/truncated_normal/mul3pre_action/kernel/Initializer/truncated_normal/mean*
T0*$
_class
loc:@pre_action/kernel

pre_action/kernel
VariableV2*
dtype0*
shared_name *
shape
:@	*
	container *$
_class
loc:@pre_action/kernel
½
pre_action/kernel/AssignAssignpre_action/kernel.pre_action/kernel/Initializer/truncated_normal*
T0*
use_locking(*
validate_shape(*$
_class
loc:@pre_action/kernel
d
pre_action/kernel/readIdentitypre_action/kernel*
T0*$
_class
loc:@pre_action/kernel
t
pre_action/MatMulMatMuldropout/Identitypre_action/kernel/read*
transpose_b( *
T0*
transpose_a( 
D
clip_by_value/Minimum/yConst*
valueB
 *  ?*
dtype0
U
clip_by_value/MinimumMinimumpre_action/MatMulclip_by_value/Minimum/y*
T0
<
clip_by_value/yConst*
valueB
 *  ¿*
dtype0
I
clip_by_valueMaximumclip_by_value/Minimumclip_by_value/y*
T0
*
actionIdentityclip_by_value*
T0
H
teacher_actionPlaceholder*
dtype0*
shape:ÿÿÿÿÿÿÿÿÿ	
F
clip_by_value_1/Minimum/yConst*
valueB
 *  ?*
dtype0
V
clip_by_value_1/MinimumMinimumteacher_actionclip_by_value_1/Minimum/y*
T0
>
clip_by_value_1/yConst*
valueB
 *  ¿*
dtype0
O
clip_by_value_1Maximumclip_by_value_1/Minimumclip_by_value_1/y*
T0
H
SquaredDifferenceSquaredDifferenceclip_by_value_1action*
T0
:
ConstConst*
valueB"       *
dtype0
J
SumSumSquaredDifferenceConst*
	keep_dims( *
T0*

Tidx0
8
gradients/ShapeConst*
valueB *
dtype0
@
gradients/grad_ys_0Const*
valueB
 *  ?*
dtype0
W
gradients/FillFillgradients/Shapegradients/grad_ys_0*
T0*

index_type0
U
 gradients/Sum_grad/Reshape/shapeConst*
valueB"      *
dtype0
n
gradients/Sum_grad/ReshapeReshapegradients/Fill gradients/Sum_grad/Reshape/shape*
T0*
Tshape0
M
gradients/Sum_grad/ShapeShapeSquaredDifference*
T0*
out_type0
p
gradients/Sum_grad/TileTilegradients/Sum_grad/Reshapegradients/Sum_grad/Shape*
T0*

Tmultiples0
Y
&gradients/SquaredDifference_grad/ShapeShapeclip_by_value_1*
T0*
out_type0
R
(gradients/SquaredDifference_grad/Shape_1Shapeaction*
T0*
out_type0
ª
6gradients/SquaredDifference_grad/BroadcastGradientArgsBroadcastGradientArgs&gradients/SquaredDifference_grad/Shape(gradients/SquaredDifference_grad/Shape_1*
T0
n
'gradients/SquaredDifference_grad/scalarConst^gradients/Sum_grad/Tile*
valueB
 *   @*
dtype0
v
$gradients/SquaredDifference_grad/mulMul'gradients/SquaredDifference_grad/scalargradients/Sum_grad/Tile*
T0
g
$gradients/SquaredDifference_grad/subSubclip_by_value_1action^gradients/Sum_grad/Tile*
T0

&gradients/SquaredDifference_grad/mul_1Mul$gradients/SquaredDifference_grad/mul$gradients/SquaredDifference_grad/sub*
T0
±
$gradients/SquaredDifference_grad/SumSum&gradients/SquaredDifference_grad/mul_16gradients/SquaredDifference_grad/BroadcastGradientArgs*
	keep_dims( *
T0*

Tidx0

(gradients/SquaredDifference_grad/ReshapeReshape$gradients/SquaredDifference_grad/Sum&gradients/SquaredDifference_grad/Shape*
T0*
Tshape0
µ
&gradients/SquaredDifference_grad/Sum_1Sum&gradients/SquaredDifference_grad/mul_18gradients/SquaredDifference_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0*

Tidx0

*gradients/SquaredDifference_grad/Reshape_1Reshape&gradients/SquaredDifference_grad/Sum_1(gradients/SquaredDifference_grad/Shape_1*
T0*
Tshape0
`
$gradients/SquaredDifference_grad/NegNeg*gradients/SquaredDifference_grad/Reshape_1*
T0

1gradients/SquaredDifference_grad/tuple/group_depsNoOp)^gradients/SquaredDifference_grad/Reshape%^gradients/SquaredDifference_grad/Neg
é
9gradients/SquaredDifference_grad/tuple/control_dependencyIdentity(gradients/SquaredDifference_grad/Reshape2^gradients/SquaredDifference_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients/SquaredDifference_grad/Reshape
ã
;gradients/SquaredDifference_grad/tuple/control_dependency_1Identity$gradients/SquaredDifference_grad/Neg2^gradients/SquaredDifference_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/SquaredDifference_grad/Neg
[
"gradients/clip_by_value_grad/ShapeShapeclip_by_value/Minimum*
T0*
out_type0
M
$gradients/clip_by_value_grad/Shape_1Const*
valueB *
dtype0

$gradients/clip_by_value_grad/Shape_2Shape;gradients/SquaredDifference_grad/tuple/control_dependency_1*
T0*
out_type0
U
(gradients/clip_by_value_grad/zeros/ConstConst*
valueB
 *    *
dtype0

"gradients/clip_by_value_grad/zerosFill$gradients/clip_by_value_grad/Shape_2(gradients/clip_by_value_grad/zeros/Const*
T0*

index_type0
j
)gradients/clip_by_value_grad/GreaterEqualGreaterEqualclip_by_value/Minimumclip_by_value/y*
T0

2gradients/clip_by_value_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/clip_by_value_grad/Shape$gradients/clip_by_value_grad/Shape_1*
T0
Â
#gradients/clip_by_value_grad/SelectSelect)gradients/clip_by_value_grad/GreaterEqual;gradients/SquaredDifference_grad/tuple/control_dependency_1"gradients/clip_by_value_grad/zeros*
T0
Ä
%gradients/clip_by_value_grad/Select_1Select)gradients/clip_by_value_grad/GreaterEqual"gradients/clip_by_value_grad/zeros;gradients/SquaredDifference_grad/tuple/control_dependency_1*
T0
¦
 gradients/clip_by_value_grad/SumSum#gradients/clip_by_value_grad/Select2gradients/clip_by_value_grad/BroadcastGradientArgs*
	keep_dims( *
T0*

Tidx0

$gradients/clip_by_value_grad/ReshapeReshape gradients/clip_by_value_grad/Sum"gradients/clip_by_value_grad/Shape*
T0*
Tshape0
¬
"gradients/clip_by_value_grad/Sum_1Sum%gradients/clip_by_value_grad/Select_14gradients/clip_by_value_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0*

Tidx0

&gradients/clip_by_value_grad/Reshape_1Reshape"gradients/clip_by_value_grad/Sum_1$gradients/clip_by_value_grad/Shape_1*
T0*
Tshape0

-gradients/clip_by_value_grad/tuple/group_depsNoOp%^gradients/clip_by_value_grad/Reshape'^gradients/clip_by_value_grad/Reshape_1
Ù
5gradients/clip_by_value_grad/tuple/control_dependencyIdentity$gradients/clip_by_value_grad/Reshape.^gradients/clip_by_value_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/clip_by_value_grad/Reshape
ß
7gradients/clip_by_value_grad/tuple/control_dependency_1Identity&gradients/clip_by_value_grad/Reshape_1.^gradients/clip_by_value_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/clip_by_value_grad/Reshape_1
_
*gradients/clip_by_value/Minimum_grad/ShapeShapepre_action/MatMul*
T0*
out_type0
U
,gradients/clip_by_value/Minimum_grad/Shape_1Const*
valueB *
dtype0

,gradients/clip_by_value/Minimum_grad/Shape_2Shape5gradients/clip_by_value_grad/tuple/control_dependency*
T0*
out_type0
]
0gradients/clip_by_value/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
­
*gradients/clip_by_value/Minimum_grad/zerosFill,gradients/clip_by_value/Minimum_grad/Shape_20gradients/clip_by_value/Minimum_grad/zeros/Const*
T0*

index_type0
p
.gradients/clip_by_value/Minimum_grad/LessEqual	LessEqualpre_action/MatMulclip_by_value/Minimum/y*
T0
¶
:gradients/clip_by_value/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs*gradients/clip_by_value/Minimum_grad/Shape,gradients/clip_by_value/Minimum_grad/Shape_1*
T0
Ñ
+gradients/clip_by_value/Minimum_grad/SelectSelect.gradients/clip_by_value/Minimum_grad/LessEqual5gradients/clip_by_value_grad/tuple/control_dependency*gradients/clip_by_value/Minimum_grad/zeros*
T0
Ó
-gradients/clip_by_value/Minimum_grad/Select_1Select.gradients/clip_by_value/Minimum_grad/LessEqual*gradients/clip_by_value/Minimum_grad/zeros5gradients/clip_by_value_grad/tuple/control_dependency*
T0
¾
(gradients/clip_by_value/Minimum_grad/SumSum+gradients/clip_by_value/Minimum_grad/Select:gradients/clip_by_value/Minimum_grad/BroadcastGradientArgs*
	keep_dims( *
T0*

Tidx0
¤
,gradients/clip_by_value/Minimum_grad/ReshapeReshape(gradients/clip_by_value/Minimum_grad/Sum*gradients/clip_by_value/Minimum_grad/Shape*
T0*
Tshape0
Ä
*gradients/clip_by_value/Minimum_grad/Sum_1Sum-gradients/clip_by_value/Minimum_grad/Select_1<gradients/clip_by_value/Minimum_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0*

Tidx0
ª
.gradients/clip_by_value/Minimum_grad/Reshape_1Reshape*gradients/clip_by_value/Minimum_grad/Sum_1,gradients/clip_by_value/Minimum_grad/Shape_1*
T0*
Tshape0

5gradients/clip_by_value/Minimum_grad/tuple/group_depsNoOp-^gradients/clip_by_value/Minimum_grad/Reshape/^gradients/clip_by_value/Minimum_grad/Reshape_1
ù
=gradients/clip_by_value/Minimum_grad/tuple/control_dependencyIdentity,gradients/clip_by_value/Minimum_grad/Reshape6^gradients/clip_by_value/Minimum_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients/clip_by_value/Minimum_grad/Reshape
ÿ
?gradients/clip_by_value/Minimum_grad/tuple/control_dependency_1Identity.gradients/clip_by_value/Minimum_grad/Reshape_16^gradients/clip_by_value/Minimum_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients/clip_by_value/Minimum_grad/Reshape_1
·
'gradients/pre_action/MatMul_grad/MatMulMatMul=gradients/clip_by_value/Minimum_grad/tuple/control_dependencypre_action/kernel/read*
transpose_b(*
T0*
transpose_a( 
³
)gradients/pre_action/MatMul_grad/MatMul_1MatMuldropout/Identity=gradients/clip_by_value/Minimum_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(

1gradients/pre_action/MatMul_grad/tuple/group_depsNoOp(^gradients/pre_action/MatMul_grad/MatMul*^gradients/pre_action/MatMul_grad/MatMul_1
ç
9gradients/pre_action/MatMul_grad/tuple/control_dependencyIdentity'gradients/pre_action/MatMul_grad/MatMul2^gradients/pre_action/MatMul_grad/tuple/group_deps*
T0*:
_class0
.,loc:@gradients/pre_action/MatMul_grad/MatMul
í
;gradients/pre_action/MatMul_grad/tuple/control_dependency_1Identity)gradients/pre_action/MatMul_grad/MatMul_12^gradients/pre_action/MatMul_grad/tuple/group_deps*
T0*<
_class2
0.loc:@gradients/pre_action/MatMul_grad/MatMul_1
o
.gradients/main_graph_0/hidden_3/Mul_grad/ShapeShapemain_graph_0/hidden_3/BiasAdd*
T0*
out_type0
q
0gradients/main_graph_0/hidden_3/Mul_grad/Shape_1Shapemain_graph_0/hidden_3/Sigmoid*
T0*
out_type0
Â
>gradients/main_graph_0/hidden_3/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs.gradients/main_graph_0/hidden_3/Mul_grad/Shape0gradients/main_graph_0/hidden_3/Mul_grad/Shape_1*
T0

,gradients/main_graph_0/hidden_3/Mul_grad/MulMul9gradients/pre_action/MatMul_grad/tuple/control_dependencymain_graph_0/hidden_3/Sigmoid*
T0
Ç
,gradients/main_graph_0/hidden_3/Mul_grad/SumSum,gradients/main_graph_0/hidden_3/Mul_grad/Mul>gradients/main_graph_0/hidden_3/Mul_grad/BroadcastGradientArgs*
	keep_dims( *
T0*

Tidx0
°
0gradients/main_graph_0/hidden_3/Mul_grad/ReshapeReshape,gradients/main_graph_0/hidden_3/Mul_grad/Sum.gradients/main_graph_0/hidden_3/Mul_grad/Shape*
T0*
Tshape0

.gradients/main_graph_0/hidden_3/Mul_grad/Mul_1Mulmain_graph_0/hidden_3/BiasAdd9gradients/pre_action/MatMul_grad/tuple/control_dependency*
T0
Í
.gradients/main_graph_0/hidden_3/Mul_grad/Sum_1Sum.gradients/main_graph_0/hidden_3/Mul_grad/Mul_1@gradients/main_graph_0/hidden_3/Mul_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0*

Tidx0
¶
2gradients/main_graph_0/hidden_3/Mul_grad/Reshape_1Reshape.gradients/main_graph_0/hidden_3/Mul_grad/Sum_10gradients/main_graph_0/hidden_3/Mul_grad/Shape_1*
T0*
Tshape0
©
9gradients/main_graph_0/hidden_3/Mul_grad/tuple/group_depsNoOp1^gradients/main_graph_0/hidden_3/Mul_grad/Reshape3^gradients/main_graph_0/hidden_3/Mul_grad/Reshape_1

Agradients/main_graph_0/hidden_3/Mul_grad/tuple/control_dependencyIdentity0gradients/main_graph_0/hidden_3/Mul_grad/Reshape:^gradients/main_graph_0/hidden_3/Mul_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_3/Mul_grad/Reshape

Cgradients/main_graph_0/hidden_3/Mul_grad/tuple/control_dependency_1Identity2gradients/main_graph_0/hidden_3/Mul_grad/Reshape_1:^gradients/main_graph_0/hidden_3/Mul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_3/Mul_grad/Reshape_1
´
8gradients/main_graph_0/hidden_3/Sigmoid_grad/SigmoidGradSigmoidGradmain_graph_0/hidden_3/SigmoidCgradients/main_graph_0/hidden_3/Mul_grad/tuple/control_dependency_1*
T0
ê
gradients/AddNAddNAgradients/main_graph_0/hidden_3/Mul_grad/tuple/control_dependency8gradients/main_graph_0/hidden_3/Sigmoid_grad/SigmoidGrad*
T0*
N*C
_class9
75loc:@gradients/main_graph_0/hidden_3/Mul_grad/Reshape
w
8gradients/main_graph_0/hidden_3/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN*
T0*
data_formatNHWC

=gradients/main_graph_0/hidden_3/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN9^gradients/main_graph_0/hidden_3/BiasAdd_grad/BiasAddGrad
ï
Egradients/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN>^gradients/main_graph_0/hidden_3/BiasAdd_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_3/Mul_grad/Reshape
£
Ggradients/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependency_1Identity8gradients/main_graph_0/hidden_3/BiasAdd_grad/BiasAddGrad>^gradients/main_graph_0/hidden_3/BiasAdd_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients/main_graph_0/hidden_3/BiasAdd_grad/BiasAddGrad
Õ
2gradients/main_graph_0/hidden_3/MatMul_grad/MatMulMatMulEgradients/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependency!main_graph_0/hidden_3/kernel/read*
transpose_b(*
T0*
transpose_a( 
Ï
4gradients/main_graph_0/hidden_3/MatMul_grad/MatMul_1MatMulmain_graph_0/hidden_2/MulEgradients/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
°
<gradients/main_graph_0/hidden_3/MatMul_grad/tuple/group_depsNoOp3^gradients/main_graph_0/hidden_3/MatMul_grad/MatMul5^gradients/main_graph_0/hidden_3/MatMul_grad/MatMul_1

Dgradients/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependencyIdentity2gradients/main_graph_0/hidden_3/MatMul_grad/MatMul=^gradients/main_graph_0/hidden_3/MatMul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_3/MatMul_grad/MatMul

Fgradients/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependency_1Identity4gradients/main_graph_0/hidden_3/MatMul_grad/MatMul_1=^gradients/main_graph_0/hidden_3/MatMul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients/main_graph_0/hidden_3/MatMul_grad/MatMul_1
o
.gradients/main_graph_0/hidden_2/Mul_grad/ShapeShapemain_graph_0/hidden_2/BiasAdd*
T0*
out_type0
q
0gradients/main_graph_0/hidden_2/Mul_grad/Shape_1Shapemain_graph_0/hidden_2/Sigmoid*
T0*
out_type0
Â
>gradients/main_graph_0/hidden_2/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs.gradients/main_graph_0/hidden_2/Mul_grad/Shape0gradients/main_graph_0/hidden_2/Mul_grad/Shape_1*
T0
¡
,gradients/main_graph_0/hidden_2/Mul_grad/MulMulDgradients/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependencymain_graph_0/hidden_2/Sigmoid*
T0
Ç
,gradients/main_graph_0/hidden_2/Mul_grad/SumSum,gradients/main_graph_0/hidden_2/Mul_grad/Mul>gradients/main_graph_0/hidden_2/Mul_grad/BroadcastGradientArgs*
	keep_dims( *
T0*

Tidx0
°
0gradients/main_graph_0/hidden_2/Mul_grad/ReshapeReshape,gradients/main_graph_0/hidden_2/Mul_grad/Sum.gradients/main_graph_0/hidden_2/Mul_grad/Shape*
T0*
Tshape0
£
.gradients/main_graph_0/hidden_2/Mul_grad/Mul_1Mulmain_graph_0/hidden_2/BiasAddDgradients/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependency*
T0
Í
.gradients/main_graph_0/hidden_2/Mul_grad/Sum_1Sum.gradients/main_graph_0/hidden_2/Mul_grad/Mul_1@gradients/main_graph_0/hidden_2/Mul_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0*

Tidx0
¶
2gradients/main_graph_0/hidden_2/Mul_grad/Reshape_1Reshape.gradients/main_graph_0/hidden_2/Mul_grad/Sum_10gradients/main_graph_0/hidden_2/Mul_grad/Shape_1*
T0*
Tshape0
©
9gradients/main_graph_0/hidden_2/Mul_grad/tuple/group_depsNoOp1^gradients/main_graph_0/hidden_2/Mul_grad/Reshape3^gradients/main_graph_0/hidden_2/Mul_grad/Reshape_1

Agradients/main_graph_0/hidden_2/Mul_grad/tuple/control_dependencyIdentity0gradients/main_graph_0/hidden_2/Mul_grad/Reshape:^gradients/main_graph_0/hidden_2/Mul_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_2/Mul_grad/Reshape

Cgradients/main_graph_0/hidden_2/Mul_grad/tuple/control_dependency_1Identity2gradients/main_graph_0/hidden_2/Mul_grad/Reshape_1:^gradients/main_graph_0/hidden_2/Mul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_2/Mul_grad/Reshape_1
´
8gradients/main_graph_0/hidden_2/Sigmoid_grad/SigmoidGradSigmoidGradmain_graph_0/hidden_2/SigmoidCgradients/main_graph_0/hidden_2/Mul_grad/tuple/control_dependency_1*
T0
ì
gradients/AddN_1AddNAgradients/main_graph_0/hidden_2/Mul_grad/tuple/control_dependency8gradients/main_graph_0/hidden_2/Sigmoid_grad/SigmoidGrad*
T0*
N*C
_class9
75loc:@gradients/main_graph_0/hidden_2/Mul_grad/Reshape
y
8gradients/main_graph_0/hidden_2/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_1*
T0*
data_formatNHWC

=gradients/main_graph_0/hidden_2/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_19^gradients/main_graph_0/hidden_2/BiasAdd_grad/BiasAddGrad
ñ
Egradients/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_1>^gradients/main_graph_0/hidden_2/BiasAdd_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_2/Mul_grad/Reshape
£
Ggradients/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependency_1Identity8gradients/main_graph_0/hidden_2/BiasAdd_grad/BiasAddGrad>^gradients/main_graph_0/hidden_2/BiasAdd_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients/main_graph_0/hidden_2/BiasAdd_grad/BiasAddGrad
Õ
2gradients/main_graph_0/hidden_2/MatMul_grad/MatMulMatMulEgradients/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependency!main_graph_0/hidden_2/kernel/read*
transpose_b(*
T0*
transpose_a( 
Ï
4gradients/main_graph_0/hidden_2/MatMul_grad/MatMul_1MatMulmain_graph_0/hidden_1/MulEgradients/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
°
<gradients/main_graph_0/hidden_2/MatMul_grad/tuple/group_depsNoOp3^gradients/main_graph_0/hidden_2/MatMul_grad/MatMul5^gradients/main_graph_0/hidden_2/MatMul_grad/MatMul_1

Dgradients/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependencyIdentity2gradients/main_graph_0/hidden_2/MatMul_grad/MatMul=^gradients/main_graph_0/hidden_2/MatMul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_2/MatMul_grad/MatMul

Fgradients/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependency_1Identity4gradients/main_graph_0/hidden_2/MatMul_grad/MatMul_1=^gradients/main_graph_0/hidden_2/MatMul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients/main_graph_0/hidden_2/MatMul_grad/MatMul_1
o
.gradients/main_graph_0/hidden_1/Mul_grad/ShapeShapemain_graph_0/hidden_1/BiasAdd*
T0*
out_type0
q
0gradients/main_graph_0/hidden_1/Mul_grad/Shape_1Shapemain_graph_0/hidden_1/Sigmoid*
T0*
out_type0
Â
>gradients/main_graph_0/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs.gradients/main_graph_0/hidden_1/Mul_grad/Shape0gradients/main_graph_0/hidden_1/Mul_grad/Shape_1*
T0
¡
,gradients/main_graph_0/hidden_1/Mul_grad/MulMulDgradients/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependencymain_graph_0/hidden_1/Sigmoid*
T0
Ç
,gradients/main_graph_0/hidden_1/Mul_grad/SumSum,gradients/main_graph_0/hidden_1/Mul_grad/Mul>gradients/main_graph_0/hidden_1/Mul_grad/BroadcastGradientArgs*
	keep_dims( *
T0*

Tidx0
°
0gradients/main_graph_0/hidden_1/Mul_grad/ReshapeReshape,gradients/main_graph_0/hidden_1/Mul_grad/Sum.gradients/main_graph_0/hidden_1/Mul_grad/Shape*
T0*
Tshape0
£
.gradients/main_graph_0/hidden_1/Mul_grad/Mul_1Mulmain_graph_0/hidden_1/BiasAddDgradients/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependency*
T0
Í
.gradients/main_graph_0/hidden_1/Mul_grad/Sum_1Sum.gradients/main_graph_0/hidden_1/Mul_grad/Mul_1@gradients/main_graph_0/hidden_1/Mul_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0*

Tidx0
¶
2gradients/main_graph_0/hidden_1/Mul_grad/Reshape_1Reshape.gradients/main_graph_0/hidden_1/Mul_grad/Sum_10gradients/main_graph_0/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
©
9gradients/main_graph_0/hidden_1/Mul_grad/tuple/group_depsNoOp1^gradients/main_graph_0/hidden_1/Mul_grad/Reshape3^gradients/main_graph_0/hidden_1/Mul_grad/Reshape_1

Agradients/main_graph_0/hidden_1/Mul_grad/tuple/control_dependencyIdentity0gradients/main_graph_0/hidden_1/Mul_grad/Reshape:^gradients/main_graph_0/hidden_1/Mul_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_1/Mul_grad/Reshape

Cgradients/main_graph_0/hidden_1/Mul_grad/tuple/control_dependency_1Identity2gradients/main_graph_0/hidden_1/Mul_grad/Reshape_1:^gradients/main_graph_0/hidden_1/Mul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_1/Mul_grad/Reshape_1
´
8gradients/main_graph_0/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGradmain_graph_0/hidden_1/SigmoidCgradients/main_graph_0/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
ì
gradients/AddN_2AddNAgradients/main_graph_0/hidden_1/Mul_grad/tuple/control_dependency8gradients/main_graph_0/hidden_1/Sigmoid_grad/SigmoidGrad*
T0*
N*C
_class9
75loc:@gradients/main_graph_0/hidden_1/Mul_grad/Reshape
y
8gradients/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_2*
T0*
data_formatNHWC

=gradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_29^gradients/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGrad
ñ
Egradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_2>^gradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_1/Mul_grad/Reshape
£
Ggradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency_1Identity8gradients/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGrad>^gradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGrad
Õ
2gradients/main_graph_0/hidden_1/MatMul_grad/MatMulMatMulEgradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency!main_graph_0/hidden_1/kernel/read*
transpose_b(*
T0*
transpose_a( 
Ï
4gradients/main_graph_0/hidden_1/MatMul_grad/MatMul_1MatMulmain_graph_0/hidden_0/MulEgradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
°
<gradients/main_graph_0/hidden_1/MatMul_grad/tuple/group_depsNoOp3^gradients/main_graph_0/hidden_1/MatMul_grad/MatMul5^gradients/main_graph_0/hidden_1/MatMul_grad/MatMul_1

Dgradients/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependencyIdentity2gradients/main_graph_0/hidden_1/MatMul_grad/MatMul=^gradients/main_graph_0/hidden_1/MatMul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_1/MatMul_grad/MatMul

Fgradients/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependency_1Identity4gradients/main_graph_0/hidden_1/MatMul_grad/MatMul_1=^gradients/main_graph_0/hidden_1/MatMul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients/main_graph_0/hidden_1/MatMul_grad/MatMul_1
o
.gradients/main_graph_0/hidden_0/Mul_grad/ShapeShapemain_graph_0/hidden_0/BiasAdd*
T0*
out_type0
q
0gradients/main_graph_0/hidden_0/Mul_grad/Shape_1Shapemain_graph_0/hidden_0/Sigmoid*
T0*
out_type0
Â
>gradients/main_graph_0/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs.gradients/main_graph_0/hidden_0/Mul_grad/Shape0gradients/main_graph_0/hidden_0/Mul_grad/Shape_1*
T0
¡
,gradients/main_graph_0/hidden_0/Mul_grad/MulMulDgradients/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependencymain_graph_0/hidden_0/Sigmoid*
T0
Ç
,gradients/main_graph_0/hidden_0/Mul_grad/SumSum,gradients/main_graph_0/hidden_0/Mul_grad/Mul>gradients/main_graph_0/hidden_0/Mul_grad/BroadcastGradientArgs*
	keep_dims( *
T0*

Tidx0
°
0gradients/main_graph_0/hidden_0/Mul_grad/ReshapeReshape,gradients/main_graph_0/hidden_0/Mul_grad/Sum.gradients/main_graph_0/hidden_0/Mul_grad/Shape*
T0*
Tshape0
£
.gradients/main_graph_0/hidden_0/Mul_grad/Mul_1Mulmain_graph_0/hidden_0/BiasAddDgradients/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependency*
T0
Í
.gradients/main_graph_0/hidden_0/Mul_grad/Sum_1Sum.gradients/main_graph_0/hidden_0/Mul_grad/Mul_1@gradients/main_graph_0/hidden_0/Mul_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0*

Tidx0
¶
2gradients/main_graph_0/hidden_0/Mul_grad/Reshape_1Reshape.gradients/main_graph_0/hidden_0/Mul_grad/Sum_10gradients/main_graph_0/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
©
9gradients/main_graph_0/hidden_0/Mul_grad/tuple/group_depsNoOp1^gradients/main_graph_0/hidden_0/Mul_grad/Reshape3^gradients/main_graph_0/hidden_0/Mul_grad/Reshape_1

Agradients/main_graph_0/hidden_0/Mul_grad/tuple/control_dependencyIdentity0gradients/main_graph_0/hidden_0/Mul_grad/Reshape:^gradients/main_graph_0/hidden_0/Mul_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_0/Mul_grad/Reshape

Cgradients/main_graph_0/hidden_0/Mul_grad/tuple/control_dependency_1Identity2gradients/main_graph_0/hidden_0/Mul_grad/Reshape_1:^gradients/main_graph_0/hidden_0/Mul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_0/Mul_grad/Reshape_1
´
8gradients/main_graph_0/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGradmain_graph_0/hidden_0/SigmoidCgradients/main_graph_0/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
ì
gradients/AddN_3AddNAgradients/main_graph_0/hidden_0/Mul_grad/tuple/control_dependency8gradients/main_graph_0/hidden_0/Sigmoid_grad/SigmoidGrad*
T0*
N*C
_class9
75loc:@gradients/main_graph_0/hidden_0/Mul_grad/Reshape
y
8gradients/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_3*
T0*
data_formatNHWC

=gradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_39^gradients/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGrad
ñ
Egradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_3>^gradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_0/Mul_grad/Reshape
£
Ggradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency_1Identity8gradients/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGrad>^gradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGrad
Õ
2gradients/main_graph_0/hidden_0/MatMul_grad/MatMulMatMulEgradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency!main_graph_0/hidden_0/kernel/read*
transpose_b(*
T0*
transpose_a( 
È
4gradients/main_graph_0/hidden_0/MatMul_grad/MatMul_1MatMulvector_observationEgradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
°
<gradients/main_graph_0/hidden_0/MatMul_grad/tuple/group_depsNoOp3^gradients/main_graph_0/hidden_0/MatMul_grad/MatMul5^gradients/main_graph_0/hidden_0/MatMul_grad/MatMul_1

Dgradients/main_graph_0/hidden_0/MatMul_grad/tuple/control_dependencyIdentity2gradients/main_graph_0/hidden_0/MatMul_grad/MatMul=^gradients/main_graph_0/hidden_0/MatMul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_0/MatMul_grad/MatMul

Fgradients/main_graph_0/hidden_0/MatMul_grad/tuple/control_dependency_1Identity4gradients/main_graph_0/hidden_0/MatMul_grad/MatMul_1=^gradients/main_graph_0/hidden_0/MatMul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients/main_graph_0/hidden_0/MatMul_grad/MatMul_1
u
beta1_power/initial_valueConst*
valueB
 *fff?*
dtype0*-
_class#
!loc:@main_graph_0/hidden_0/bias

beta1_power
VariableV2*
dtype0*
shared_name *
shape: *
	container *-
_class#
!loc:@main_graph_0/hidden_0/bias
¥
beta1_power/AssignAssignbeta1_powerbeta1_power/initial_value*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_0/bias
a
beta1_power/readIdentitybeta1_power*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias
u
beta2_power/initial_valueConst*
valueB
 *w¾?*
dtype0*-
_class#
!loc:@main_graph_0/hidden_0/bias

beta2_power
VariableV2*
dtype0*
shared_name *
shape: *
	container *-
_class#
!loc:@main_graph_0/hidden_0/bias
¥
beta2_power/AssignAssignbeta2_powerbeta2_power/initial_value*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_0/bias
a
beta2_power/readIdentitybeta2_power*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias
©
Cmain_graph_0/hidden_0/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"   @   *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel

9main_graph_0/hidden_0/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel

3main_graph_0/hidden_0/kernel/Adam/Initializer/zerosFillCmain_graph_0/hidden_0/kernel/Adam/Initializer/zeros/shape_as_tensor9main_graph_0/hidden_0/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
¦
!main_graph_0/hidden_0/kernel/Adam
VariableV2*
dtype0*
shared_name *
shape
:@*
	container */
_class%
#!loc:@main_graph_0/hidden_0/kernel
í
(main_graph_0/hidden_0/kernel/Adam/AssignAssign!main_graph_0/hidden_0/kernel/Adam3main_graph_0/hidden_0/kernel/Adam/Initializer/zeros*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_0/kernel

&main_graph_0/hidden_0/kernel/Adam/readIdentity!main_graph_0/hidden_0/kernel/Adam*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
«
Emain_graph_0/hidden_0/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"   @   *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel

;main_graph_0/hidden_0/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel

5main_graph_0/hidden_0/kernel/Adam_1/Initializer/zerosFillEmain_graph_0/hidden_0/kernel/Adam_1/Initializer/zeros/shape_as_tensor;main_graph_0/hidden_0/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
¨
#main_graph_0/hidden_0/kernel/Adam_1
VariableV2*
dtype0*
shared_name *
shape
:@*
	container */
_class%
#!loc:@main_graph_0/hidden_0/kernel
ó
*main_graph_0/hidden_0/kernel/Adam_1/AssignAssign#main_graph_0/hidden_0/kernel/Adam_15main_graph_0/hidden_0/kernel/Adam_1/Initializer/zeros*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_0/kernel

(main_graph_0/hidden_0/kernel/Adam_1/readIdentity#main_graph_0/hidden_0/kernel/Adam_1*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel

Amain_graph_0/hidden_0/bias/Adam/Initializer/zeros/shape_as_tensorConst*
valueB:@*
dtype0*-
_class#
!loc:@main_graph_0/hidden_0/bias

7main_graph_0/hidden_0/bias/Adam/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*-
_class#
!loc:@main_graph_0/hidden_0/bias
ÿ
1main_graph_0/hidden_0/bias/Adam/Initializer/zerosFillAmain_graph_0/hidden_0/bias/Adam/Initializer/zeros/shape_as_tensor7main_graph_0/hidden_0/bias/Adam/Initializer/zeros/Const*
T0*

index_type0*-
_class#
!loc:@main_graph_0/hidden_0/bias

main_graph_0/hidden_0/bias/Adam
VariableV2*
dtype0*
shared_name *
shape:@*
	container *-
_class#
!loc:@main_graph_0/hidden_0/bias
å
&main_graph_0/hidden_0/bias/Adam/AssignAssignmain_graph_0/hidden_0/bias/Adam1main_graph_0/hidden_0/bias/Adam/Initializer/zeros*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_0/bias

$main_graph_0/hidden_0/bias/Adam/readIdentitymain_graph_0/hidden_0/bias/Adam*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias
 
Cmain_graph_0/hidden_0/bias/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB:@*
dtype0*-
_class#
!loc:@main_graph_0/hidden_0/bias

9main_graph_0/hidden_0/bias/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*-
_class#
!loc:@main_graph_0/hidden_0/bias

3main_graph_0/hidden_0/bias/Adam_1/Initializer/zerosFillCmain_graph_0/hidden_0/bias/Adam_1/Initializer/zeros/shape_as_tensor9main_graph_0/hidden_0/bias/Adam_1/Initializer/zeros/Const*
T0*

index_type0*-
_class#
!loc:@main_graph_0/hidden_0/bias
 
!main_graph_0/hidden_0/bias/Adam_1
VariableV2*
dtype0*
shared_name *
shape:@*
	container *-
_class#
!loc:@main_graph_0/hidden_0/bias
ë
(main_graph_0/hidden_0/bias/Adam_1/AssignAssign!main_graph_0/hidden_0/bias/Adam_13main_graph_0/hidden_0/bias/Adam_1/Initializer/zeros*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_0/bias

&main_graph_0/hidden_0/bias/Adam_1/readIdentity!main_graph_0/hidden_0/bias/Adam_1*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias
©
Cmain_graph_0/hidden_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"@   @   *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel

9main_graph_0/hidden_1/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel

3main_graph_0/hidden_1/kernel/Adam/Initializer/zerosFillCmain_graph_0/hidden_1/kernel/Adam/Initializer/zeros/shape_as_tensor9main_graph_0/hidden_1/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
¦
!main_graph_0/hidden_1/kernel/Adam
VariableV2*
dtype0*
shared_name *
shape
:@@*
	container */
_class%
#!loc:@main_graph_0/hidden_1/kernel
í
(main_graph_0/hidden_1/kernel/Adam/AssignAssign!main_graph_0/hidden_1/kernel/Adam3main_graph_0/hidden_1/kernel/Adam/Initializer/zeros*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_1/kernel

&main_graph_0/hidden_1/kernel/Adam/readIdentity!main_graph_0/hidden_1/kernel/Adam*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
«
Emain_graph_0/hidden_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"@   @   *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel

;main_graph_0/hidden_1/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel

5main_graph_0/hidden_1/kernel/Adam_1/Initializer/zerosFillEmain_graph_0/hidden_1/kernel/Adam_1/Initializer/zeros/shape_as_tensor;main_graph_0/hidden_1/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
¨
#main_graph_0/hidden_1/kernel/Adam_1
VariableV2*
dtype0*
shared_name *
shape
:@@*
	container */
_class%
#!loc:@main_graph_0/hidden_1/kernel
ó
*main_graph_0/hidden_1/kernel/Adam_1/AssignAssign#main_graph_0/hidden_1/kernel/Adam_15main_graph_0/hidden_1/kernel/Adam_1/Initializer/zeros*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_1/kernel

(main_graph_0/hidden_1/kernel/Adam_1/readIdentity#main_graph_0/hidden_1/kernel/Adam_1*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel

Amain_graph_0/hidden_1/bias/Adam/Initializer/zeros/shape_as_tensorConst*
valueB:@*
dtype0*-
_class#
!loc:@main_graph_0/hidden_1/bias

7main_graph_0/hidden_1/bias/Adam/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*-
_class#
!loc:@main_graph_0/hidden_1/bias
ÿ
1main_graph_0/hidden_1/bias/Adam/Initializer/zerosFillAmain_graph_0/hidden_1/bias/Adam/Initializer/zeros/shape_as_tensor7main_graph_0/hidden_1/bias/Adam/Initializer/zeros/Const*
T0*

index_type0*-
_class#
!loc:@main_graph_0/hidden_1/bias

main_graph_0/hidden_1/bias/Adam
VariableV2*
dtype0*
shared_name *
shape:@*
	container *-
_class#
!loc:@main_graph_0/hidden_1/bias
å
&main_graph_0/hidden_1/bias/Adam/AssignAssignmain_graph_0/hidden_1/bias/Adam1main_graph_0/hidden_1/bias/Adam/Initializer/zeros*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_1/bias

$main_graph_0/hidden_1/bias/Adam/readIdentitymain_graph_0/hidden_1/bias/Adam*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias
 
Cmain_graph_0/hidden_1/bias/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB:@*
dtype0*-
_class#
!loc:@main_graph_0/hidden_1/bias

9main_graph_0/hidden_1/bias/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*-
_class#
!loc:@main_graph_0/hidden_1/bias

3main_graph_0/hidden_1/bias/Adam_1/Initializer/zerosFillCmain_graph_0/hidden_1/bias/Adam_1/Initializer/zeros/shape_as_tensor9main_graph_0/hidden_1/bias/Adam_1/Initializer/zeros/Const*
T0*

index_type0*-
_class#
!loc:@main_graph_0/hidden_1/bias
 
!main_graph_0/hidden_1/bias/Adam_1
VariableV2*
dtype0*
shared_name *
shape:@*
	container *-
_class#
!loc:@main_graph_0/hidden_1/bias
ë
(main_graph_0/hidden_1/bias/Adam_1/AssignAssign!main_graph_0/hidden_1/bias/Adam_13main_graph_0/hidden_1/bias/Adam_1/Initializer/zeros*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_1/bias

&main_graph_0/hidden_1/bias/Adam_1/readIdentity!main_graph_0/hidden_1/bias/Adam_1*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias
©
Cmain_graph_0/hidden_2/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"@   @   *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel

9main_graph_0/hidden_2/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel

3main_graph_0/hidden_2/kernel/Adam/Initializer/zerosFillCmain_graph_0/hidden_2/kernel/Adam/Initializer/zeros/shape_as_tensor9main_graph_0/hidden_2/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel
¦
!main_graph_0/hidden_2/kernel/Adam
VariableV2*
dtype0*
shared_name *
shape
:@@*
	container */
_class%
#!loc:@main_graph_0/hidden_2/kernel
í
(main_graph_0/hidden_2/kernel/Adam/AssignAssign!main_graph_0/hidden_2/kernel/Adam3main_graph_0/hidden_2/kernel/Adam/Initializer/zeros*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_2/kernel

&main_graph_0/hidden_2/kernel/Adam/readIdentity!main_graph_0/hidden_2/kernel/Adam*
T0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel
«
Emain_graph_0/hidden_2/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"@   @   *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel

;main_graph_0/hidden_2/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel

5main_graph_0/hidden_2/kernel/Adam_1/Initializer/zerosFillEmain_graph_0/hidden_2/kernel/Adam_1/Initializer/zeros/shape_as_tensor;main_graph_0/hidden_2/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel
¨
#main_graph_0/hidden_2/kernel/Adam_1
VariableV2*
dtype0*
shared_name *
shape
:@@*
	container */
_class%
#!loc:@main_graph_0/hidden_2/kernel
ó
*main_graph_0/hidden_2/kernel/Adam_1/AssignAssign#main_graph_0/hidden_2/kernel/Adam_15main_graph_0/hidden_2/kernel/Adam_1/Initializer/zeros*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_2/kernel

(main_graph_0/hidden_2/kernel/Adam_1/readIdentity#main_graph_0/hidden_2/kernel/Adam_1*
T0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel

Amain_graph_0/hidden_2/bias/Adam/Initializer/zeros/shape_as_tensorConst*
valueB:@*
dtype0*-
_class#
!loc:@main_graph_0/hidden_2/bias

7main_graph_0/hidden_2/bias/Adam/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*-
_class#
!loc:@main_graph_0/hidden_2/bias
ÿ
1main_graph_0/hidden_2/bias/Adam/Initializer/zerosFillAmain_graph_0/hidden_2/bias/Adam/Initializer/zeros/shape_as_tensor7main_graph_0/hidden_2/bias/Adam/Initializer/zeros/Const*
T0*

index_type0*-
_class#
!loc:@main_graph_0/hidden_2/bias

main_graph_0/hidden_2/bias/Adam
VariableV2*
dtype0*
shared_name *
shape:@*
	container *-
_class#
!loc:@main_graph_0/hidden_2/bias
å
&main_graph_0/hidden_2/bias/Adam/AssignAssignmain_graph_0/hidden_2/bias/Adam1main_graph_0/hidden_2/bias/Adam/Initializer/zeros*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_2/bias

$main_graph_0/hidden_2/bias/Adam/readIdentitymain_graph_0/hidden_2/bias/Adam*
T0*-
_class#
!loc:@main_graph_0/hidden_2/bias
 
Cmain_graph_0/hidden_2/bias/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB:@*
dtype0*-
_class#
!loc:@main_graph_0/hidden_2/bias

9main_graph_0/hidden_2/bias/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*-
_class#
!loc:@main_graph_0/hidden_2/bias

3main_graph_0/hidden_2/bias/Adam_1/Initializer/zerosFillCmain_graph_0/hidden_2/bias/Adam_1/Initializer/zeros/shape_as_tensor9main_graph_0/hidden_2/bias/Adam_1/Initializer/zeros/Const*
T0*

index_type0*-
_class#
!loc:@main_graph_0/hidden_2/bias
 
!main_graph_0/hidden_2/bias/Adam_1
VariableV2*
dtype0*
shared_name *
shape:@*
	container *-
_class#
!loc:@main_graph_0/hidden_2/bias
ë
(main_graph_0/hidden_2/bias/Adam_1/AssignAssign!main_graph_0/hidden_2/bias/Adam_13main_graph_0/hidden_2/bias/Adam_1/Initializer/zeros*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_2/bias

&main_graph_0/hidden_2/bias/Adam_1/readIdentity!main_graph_0/hidden_2/bias/Adam_1*
T0*-
_class#
!loc:@main_graph_0/hidden_2/bias
©
Cmain_graph_0/hidden_3/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"@   @   *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel

9main_graph_0/hidden_3/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel

3main_graph_0/hidden_3/kernel/Adam/Initializer/zerosFillCmain_graph_0/hidden_3/kernel/Adam/Initializer/zeros/shape_as_tensor9main_graph_0/hidden_3/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel
¦
!main_graph_0/hidden_3/kernel/Adam
VariableV2*
dtype0*
shared_name *
shape
:@@*
	container */
_class%
#!loc:@main_graph_0/hidden_3/kernel
í
(main_graph_0/hidden_3/kernel/Adam/AssignAssign!main_graph_0/hidden_3/kernel/Adam3main_graph_0/hidden_3/kernel/Adam/Initializer/zeros*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_3/kernel

&main_graph_0/hidden_3/kernel/Adam/readIdentity!main_graph_0/hidden_3/kernel/Adam*
T0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel
«
Emain_graph_0/hidden_3/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"@   @   *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel

;main_graph_0/hidden_3/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel

5main_graph_0/hidden_3/kernel/Adam_1/Initializer/zerosFillEmain_graph_0/hidden_3/kernel/Adam_1/Initializer/zeros/shape_as_tensor;main_graph_0/hidden_3/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel
¨
#main_graph_0/hidden_3/kernel/Adam_1
VariableV2*
dtype0*
shared_name *
shape
:@@*
	container */
_class%
#!loc:@main_graph_0/hidden_3/kernel
ó
*main_graph_0/hidden_3/kernel/Adam_1/AssignAssign#main_graph_0/hidden_3/kernel/Adam_15main_graph_0/hidden_3/kernel/Adam_1/Initializer/zeros*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_3/kernel

(main_graph_0/hidden_3/kernel/Adam_1/readIdentity#main_graph_0/hidden_3/kernel/Adam_1*
T0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel

Amain_graph_0/hidden_3/bias/Adam/Initializer/zeros/shape_as_tensorConst*
valueB:@*
dtype0*-
_class#
!loc:@main_graph_0/hidden_3/bias

7main_graph_0/hidden_3/bias/Adam/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*-
_class#
!loc:@main_graph_0/hidden_3/bias
ÿ
1main_graph_0/hidden_3/bias/Adam/Initializer/zerosFillAmain_graph_0/hidden_3/bias/Adam/Initializer/zeros/shape_as_tensor7main_graph_0/hidden_3/bias/Adam/Initializer/zeros/Const*
T0*

index_type0*-
_class#
!loc:@main_graph_0/hidden_3/bias

main_graph_0/hidden_3/bias/Adam
VariableV2*
dtype0*
shared_name *
shape:@*
	container *-
_class#
!loc:@main_graph_0/hidden_3/bias
å
&main_graph_0/hidden_3/bias/Adam/AssignAssignmain_graph_0/hidden_3/bias/Adam1main_graph_0/hidden_3/bias/Adam/Initializer/zeros*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_3/bias

$main_graph_0/hidden_3/bias/Adam/readIdentitymain_graph_0/hidden_3/bias/Adam*
T0*-
_class#
!loc:@main_graph_0/hidden_3/bias
 
Cmain_graph_0/hidden_3/bias/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB:@*
dtype0*-
_class#
!loc:@main_graph_0/hidden_3/bias

9main_graph_0/hidden_3/bias/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*-
_class#
!loc:@main_graph_0/hidden_3/bias

3main_graph_0/hidden_3/bias/Adam_1/Initializer/zerosFillCmain_graph_0/hidden_3/bias/Adam_1/Initializer/zeros/shape_as_tensor9main_graph_0/hidden_3/bias/Adam_1/Initializer/zeros/Const*
T0*

index_type0*-
_class#
!loc:@main_graph_0/hidden_3/bias
 
!main_graph_0/hidden_3/bias/Adam_1
VariableV2*
dtype0*
shared_name *
shape:@*
	container *-
_class#
!loc:@main_graph_0/hidden_3/bias
ë
(main_graph_0/hidden_3/bias/Adam_1/AssignAssign!main_graph_0/hidden_3/bias/Adam_13main_graph_0/hidden_3/bias/Adam_1/Initializer/zeros*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_3/bias

&main_graph_0/hidden_3/bias/Adam_1/readIdentity!main_graph_0/hidden_3/bias/Adam_1*
T0*-
_class#
!loc:@main_graph_0/hidden_3/bias

8pre_action/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"@   	   *
dtype0*$
_class
loc:@pre_action/kernel

.pre_action/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*$
_class
loc:@pre_action/kernel
Û
(pre_action/kernel/Adam/Initializer/zerosFill8pre_action/kernel/Adam/Initializer/zeros/shape_as_tensor.pre_action/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*$
_class
loc:@pre_action/kernel

pre_action/kernel/Adam
VariableV2*
dtype0*
shared_name *
shape
:@	*
	container *$
_class
loc:@pre_action/kernel
Á
pre_action/kernel/Adam/AssignAssignpre_action/kernel/Adam(pre_action/kernel/Adam/Initializer/zeros*
T0*
use_locking(*
validate_shape(*$
_class
loc:@pre_action/kernel
n
pre_action/kernel/Adam/readIdentitypre_action/kernel/Adam*
T0*$
_class
loc:@pre_action/kernel

:pre_action/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"@   	   *
dtype0*$
_class
loc:@pre_action/kernel

0pre_action/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*$
_class
loc:@pre_action/kernel
á
*pre_action/kernel/Adam_1/Initializer/zerosFill:pre_action/kernel/Adam_1/Initializer/zeros/shape_as_tensor0pre_action/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*$
_class
loc:@pre_action/kernel

pre_action/kernel/Adam_1
VariableV2*
dtype0*
shared_name *
shape
:@	*
	container *$
_class
loc:@pre_action/kernel
Ç
pre_action/kernel/Adam_1/AssignAssignpre_action/kernel/Adam_1*pre_action/kernel/Adam_1/Initializer/zeros*
T0*
use_locking(*
validate_shape(*$
_class
loc:@pre_action/kernel
r
pre_action/kernel/Adam_1/readIdentitypre_action/kernel/Adam_1*
T0*$
_class
loc:@pre_action/kernel
?
Adam/learning_rateConst*
valueB
 *RI9*
dtype0
7

Adam/beta1Const*
valueB
 *fff?*
dtype0
7

Adam/beta2Const*
valueB
 *w¾?*
dtype0
9
Adam/epsilonConst*
valueB
 *wÌ+2*
dtype0
¬
2Adam/update_main_graph_0/hidden_0/kernel/ApplyAdam	ApplyAdammain_graph_0/hidden_0/kernel!main_graph_0/hidden_0/kernel/Adam#main_graph_0/hidden_0/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonFgradients/main_graph_0/hidden_0/MatMul_grad/tuple/control_dependency_1*
T0*
use_locking( */
_class%
#!loc:@main_graph_0/hidden_0/kernel*
use_nesterov( 
£
0Adam/update_main_graph_0/hidden_0/bias/ApplyAdam	ApplyAdammain_graph_0/hidden_0/biasmain_graph_0/hidden_0/bias/Adam!main_graph_0/hidden_0/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonGgradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency_1*
T0*
use_locking( *-
_class#
!loc:@main_graph_0/hidden_0/bias*
use_nesterov( 
¬
2Adam/update_main_graph_0/hidden_1/kernel/ApplyAdam	ApplyAdammain_graph_0/hidden_1/kernel!main_graph_0/hidden_1/kernel/Adam#main_graph_0/hidden_1/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonFgradients/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependency_1*
T0*
use_locking( */
_class%
#!loc:@main_graph_0/hidden_1/kernel*
use_nesterov( 
£
0Adam/update_main_graph_0/hidden_1/bias/ApplyAdam	ApplyAdammain_graph_0/hidden_1/biasmain_graph_0/hidden_1/bias/Adam!main_graph_0/hidden_1/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonGgradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency_1*
T0*
use_locking( *-
_class#
!loc:@main_graph_0/hidden_1/bias*
use_nesterov( 
¬
2Adam/update_main_graph_0/hidden_2/kernel/ApplyAdam	ApplyAdammain_graph_0/hidden_2/kernel!main_graph_0/hidden_2/kernel/Adam#main_graph_0/hidden_2/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonFgradients/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependency_1*
T0*
use_locking( */
_class%
#!loc:@main_graph_0/hidden_2/kernel*
use_nesterov( 
£
0Adam/update_main_graph_0/hidden_2/bias/ApplyAdam	ApplyAdammain_graph_0/hidden_2/biasmain_graph_0/hidden_2/bias/Adam!main_graph_0/hidden_2/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonGgradients/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependency_1*
T0*
use_locking( *-
_class#
!loc:@main_graph_0/hidden_2/bias*
use_nesterov( 
¬
2Adam/update_main_graph_0/hidden_3/kernel/ApplyAdam	ApplyAdammain_graph_0/hidden_3/kernel!main_graph_0/hidden_3/kernel/Adam#main_graph_0/hidden_3/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonFgradients/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependency_1*
T0*
use_locking( */
_class%
#!loc:@main_graph_0/hidden_3/kernel*
use_nesterov( 
£
0Adam/update_main_graph_0/hidden_3/bias/ApplyAdam	ApplyAdammain_graph_0/hidden_3/biasmain_graph_0/hidden_3/bias/Adam!main_graph_0/hidden_3/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonGgradients/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependency_1*
T0*
use_locking( *-
_class#
!loc:@main_graph_0/hidden_3/bias*
use_nesterov( 
ê
'Adam/update_pre_action/kernel/ApplyAdam	ApplyAdampre_action/kernelpre_action/kernel/Adampre_action/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon;gradients/pre_action/MatMul_grad/tuple/control_dependency_1*
T0*
use_locking( *$
_class
loc:@pre_action/kernel*
use_nesterov( 
¯
Adam/mulMulbeta1_power/read
Adam/beta13^Adam/update_main_graph_0/hidden_0/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_0/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_1/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_1/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_2/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_2/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_3/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_3/bias/ApplyAdam(^Adam/update_pre_action/kernel/ApplyAdam*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias

Adam/AssignAssignbeta1_powerAdam/mul*
T0*
use_locking( *
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_0/bias
±

Adam/mul_1Mulbeta2_power/read
Adam/beta23^Adam/update_main_graph_0/hidden_0/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_0/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_1/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_1/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_2/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_2/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_3/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_3/bias/ApplyAdam(^Adam/update_pre_action/kernel/ApplyAdam*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias

Adam/Assign_1Assignbeta2_power
Adam/mul_1*
T0*
use_locking( *
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_0/bias
ô
AdamNoOp3^Adam/update_main_graph_0/hidden_0/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_0/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_1/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_1/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_2/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_2/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_3/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_3/bias/ApplyAdam(^Adam/update_pre_action/kernel/ApplyAdam^Adam/Assign^Adam/Assign_1
8

save/ConstConst*
valueB Bmodel*
dtype0

save/SaveV2/tensor_namesConst*â
valueØBÕ"Baction_output_shapeBbeta1_powerBbeta2_powerBglobal_stepBis_continuous_controlBmain_graph_0/hidden_0/biasBmain_graph_0/hidden_0/bias/AdamB!main_graph_0/hidden_0/bias/Adam_1Bmain_graph_0/hidden_0/kernelB!main_graph_0/hidden_0/kernel/AdamB#main_graph_0/hidden_0/kernel/Adam_1Bmain_graph_0/hidden_1/biasBmain_graph_0/hidden_1/bias/AdamB!main_graph_0/hidden_1/bias/Adam_1Bmain_graph_0/hidden_1/kernelB!main_graph_0/hidden_1/kernel/AdamB#main_graph_0/hidden_1/kernel/Adam_1Bmain_graph_0/hidden_2/biasBmain_graph_0/hidden_2/bias/AdamB!main_graph_0/hidden_2/bias/Adam_1Bmain_graph_0/hidden_2/kernelB!main_graph_0/hidden_2/kernel/AdamB#main_graph_0/hidden_2/kernel/Adam_1Bmain_graph_0/hidden_3/biasBmain_graph_0/hidden_3/bias/AdamB!main_graph_0/hidden_3/bias/Adam_1Bmain_graph_0/hidden_3/kernelB!main_graph_0/hidden_3/kernel/AdamB#main_graph_0/hidden_3/kernel/Adam_1Bmemory_sizeBpre_action/kernelBpre_action/kernel/AdamBpre_action/kernel/Adam_1Bversion_number*
dtype0

save/SaveV2/shape_and_slicesConst*W
valueNBL"B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
Ø
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesaction_output_shapebeta1_powerbeta2_powerglobal_stepis_continuous_controlmain_graph_0/hidden_0/biasmain_graph_0/hidden_0/bias/Adam!main_graph_0/hidden_0/bias/Adam_1main_graph_0/hidden_0/kernel!main_graph_0/hidden_0/kernel/Adam#main_graph_0/hidden_0/kernel/Adam_1main_graph_0/hidden_1/biasmain_graph_0/hidden_1/bias/Adam!main_graph_0/hidden_1/bias/Adam_1main_graph_0/hidden_1/kernel!main_graph_0/hidden_1/kernel/Adam#main_graph_0/hidden_1/kernel/Adam_1main_graph_0/hidden_2/biasmain_graph_0/hidden_2/bias/Adam!main_graph_0/hidden_2/bias/Adam_1main_graph_0/hidden_2/kernel!main_graph_0/hidden_2/kernel/Adam#main_graph_0/hidden_2/kernel/Adam_1main_graph_0/hidden_3/biasmain_graph_0/hidden_3/bias/Adam!main_graph_0/hidden_3/bias/Adam_1main_graph_0/hidden_3/kernel!main_graph_0/hidden_3/kernel/Adam#main_graph_0/hidden_3/kernel/Adam_1memory_sizepre_action/kernelpre_action/kernel/Adampre_action/kernel/Adam_1version_number*0
dtypes&
$2"
e
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_class
loc:@save/Const
¥
save/RestoreV2/tensor_namesConst"/device:CPU:0*â
valueØBÕ"Baction_output_shapeBbeta1_powerBbeta2_powerBglobal_stepBis_continuous_controlBmain_graph_0/hidden_0/biasBmain_graph_0/hidden_0/bias/AdamB!main_graph_0/hidden_0/bias/Adam_1Bmain_graph_0/hidden_0/kernelB!main_graph_0/hidden_0/kernel/AdamB#main_graph_0/hidden_0/kernel/Adam_1Bmain_graph_0/hidden_1/biasBmain_graph_0/hidden_1/bias/AdamB!main_graph_0/hidden_1/bias/Adam_1Bmain_graph_0/hidden_1/kernelB!main_graph_0/hidden_1/kernel/AdamB#main_graph_0/hidden_1/kernel/Adam_1Bmain_graph_0/hidden_2/biasBmain_graph_0/hidden_2/bias/AdamB!main_graph_0/hidden_2/bias/Adam_1Bmain_graph_0/hidden_2/kernelB!main_graph_0/hidden_2/kernel/AdamB#main_graph_0/hidden_2/kernel/Adam_1Bmain_graph_0/hidden_3/biasBmain_graph_0/hidden_3/bias/AdamB!main_graph_0/hidden_3/bias/Adam_1Bmain_graph_0/hidden_3/kernelB!main_graph_0/hidden_3/kernel/AdamB#main_graph_0/hidden_3/kernel/Adam_1Bmemory_sizeBpre_action/kernelBpre_action/kernel/AdamBpre_action/kernel/Adam_1Bversion_number*
dtype0

save/RestoreV2/shape_and_slicesConst"/device:CPU:0*W
valueNBL"B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
¦
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*0
dtypes&
$2"

save/AssignAssignaction_output_shapesave/RestoreV2*
T0*
use_locking(*
validate_shape(*&
_class
loc:@action_output_shape

save/Assign_1Assignbeta1_powersave/RestoreV2:1*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_0/bias

save/Assign_2Assignbeta2_powersave/RestoreV2:2*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_0/bias

save/Assign_3Assignglobal_stepsave/RestoreV2:3*
T0*
use_locking(*
validate_shape(*
_class
loc:@global_step

save/Assign_4Assignis_continuous_controlsave/RestoreV2:4*
T0*
use_locking(*
validate_shape(*(
_class
loc:@is_continuous_control
¦
save/Assign_5Assignmain_graph_0/hidden_0/biassave/RestoreV2:5*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_0/bias
«
save/Assign_6Assignmain_graph_0/hidden_0/bias/Adamsave/RestoreV2:6*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_0/bias
­
save/Assign_7Assign!main_graph_0/hidden_0/bias/Adam_1save/RestoreV2:7*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_0/bias
ª
save/Assign_8Assignmain_graph_0/hidden_0/kernelsave/RestoreV2:8*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
¯
save/Assign_9Assign!main_graph_0/hidden_0/kernel/Adamsave/RestoreV2:9*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
³
save/Assign_10Assign#main_graph_0/hidden_0/kernel/Adam_1save/RestoreV2:10*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
¨
save/Assign_11Assignmain_graph_0/hidden_1/biassave/RestoreV2:11*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_1/bias
­
save/Assign_12Assignmain_graph_0/hidden_1/bias/Adamsave/RestoreV2:12*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_1/bias
¯
save/Assign_13Assign!main_graph_0/hidden_1/bias/Adam_1save/RestoreV2:13*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_1/bias
¬
save/Assign_14Assignmain_graph_0/hidden_1/kernelsave/RestoreV2:14*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
±
save/Assign_15Assign!main_graph_0/hidden_1/kernel/Adamsave/RestoreV2:15*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
³
save/Assign_16Assign#main_graph_0/hidden_1/kernel/Adam_1save/RestoreV2:16*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
¨
save/Assign_17Assignmain_graph_0/hidden_2/biassave/RestoreV2:17*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_2/bias
­
save/Assign_18Assignmain_graph_0/hidden_2/bias/Adamsave/RestoreV2:18*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_2/bias
¯
save/Assign_19Assign!main_graph_0/hidden_2/bias/Adam_1save/RestoreV2:19*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_2/bias
¬
save/Assign_20Assignmain_graph_0/hidden_2/kernelsave/RestoreV2:20*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_2/kernel
±
save/Assign_21Assign!main_graph_0/hidden_2/kernel/Adamsave/RestoreV2:21*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_2/kernel
³
save/Assign_22Assign#main_graph_0/hidden_2/kernel/Adam_1save/RestoreV2:22*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_2/kernel
¨
save/Assign_23Assignmain_graph_0/hidden_3/biassave/RestoreV2:23*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_3/bias
­
save/Assign_24Assignmain_graph_0/hidden_3/bias/Adamsave/RestoreV2:24*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_3/bias
¯
save/Assign_25Assign!main_graph_0/hidden_3/bias/Adam_1save/RestoreV2:25*
T0*
use_locking(*
validate_shape(*-
_class#
!loc:@main_graph_0/hidden_3/bias
¬
save/Assign_26Assignmain_graph_0/hidden_3/kernelsave/RestoreV2:26*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_3/kernel
±
save/Assign_27Assign!main_graph_0/hidden_3/kernel/Adamsave/RestoreV2:27*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_3/kernel
³
save/Assign_28Assign#main_graph_0/hidden_3/kernel/Adam_1save/RestoreV2:28*
T0*
use_locking(*
validate_shape(*/
_class%
#!loc:@main_graph_0/hidden_3/kernel

save/Assign_29Assignmemory_sizesave/RestoreV2:29*
T0*
use_locking(*
validate_shape(*
_class
loc:@memory_size

save/Assign_30Assignpre_action/kernelsave/RestoreV2:30*
T0*
use_locking(*
validate_shape(*$
_class
loc:@pre_action/kernel

save/Assign_31Assignpre_action/kernel/Adamsave/RestoreV2:31*
T0*
use_locking(*
validate_shape(*$
_class
loc:@pre_action/kernel

save/Assign_32Assignpre_action/kernel/Adam_1save/RestoreV2:32*
T0*
use_locking(*
validate_shape(*$
_class
loc:@pre_action/kernel

save/Assign_33Assignversion_numbersave/RestoreV2:33*
T0*
use_locking(*
validate_shape(*!
_class
loc:@version_number
Î
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_23^save/Assign_24^save/Assign_25^save/Assign_26^save/Assign_27^save/Assign_28^save/Assign_29^save/Assign_30^save/Assign_31^save/Assign_32^save/Assign_33"