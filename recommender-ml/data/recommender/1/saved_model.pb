��	
�)�)
:
Add
x"T
y"T
z"T"
Ttype:
2	
x
Assign
ref"T�

value"T

output_ref"T�"	
Ttype"
validate_shapebool("
use_lockingbool(�
s
	AssignAdd
ref"T�

value"T

output_ref"T�" 
Ttype:
2	"
use_lockingbool( 
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
~
BiasAddGrad
out_backprop"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
I
ConcatOffset

concat_dim
shape*N
offset*N"
Nint(0
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
S
DynamicStitch
indices*N
data"T*N
merged"T"
Nint(0"	
Ttype
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
,
Floor
x"T
y"T"
Ttype:
2
?
FloorDiv
x"T
y"T
z"T"
Ttype:
2	
9
FloorMod
x"T
y"T
z"T"
Ttype:

2	
�
GatherV2
params"Tparams
indices"Tindices
axis"Taxis
output"Tparams"
Tparamstype"
Tindicestype:
2	"
Taxistype:
2	
B
GreaterEqual
x"T
y"T
z
"
Ttype:
2	
.
Identity

input"T
output"T"	
Ttype
N
IsVariableInitialized
ref"dtype�
is_initialized
"
dtypetype�
?
	LessEqual
x"T
y"T
z
"
Ttype:
2	
,
Log
x"T
y"T"
Ttype:

2
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
;
Maximum
x"T
y"T
z"T"
Ttype:

2	�
�
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(�
;
Minimum
x"T
y"T
z"T"
Ttype:

2	�
=
Mul
x"T
y"T
z"T"
Ttype:
2	�
.
Neg
x"T
y"T"
Ttype:

2	

NoOp
E
NotEqual
x"T
y"T
z
"
Ttype:
2	
�
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
6
Pow
x"T
y"T
z"T"
Ttype:

2	
�
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	�
a
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:	
2	
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
5

Reciprocal
x"T
y"T"
Ttype:

2	
E
Relu
features"T
activations"T"
Ttype:
2	
V
ReluGrad
	gradients"T
features"T
	backprops"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
e
ShapeN
input"T*N
output"out_type*N"
Nint(0"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
O
Size

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
-
Sqrt
x"T
y"T"
Ttype:

2
1
Square
x"T
y"T"
Ttype:

2	
�
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	
�
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
�
UnsortedSegmentSum	
data"T
segment_ids"Tindices
num_segments"Tnumsegments
output"T" 
Ttype:
2	"
Tindicestype:
2	" 
Tnumsegmentstype0:
2	
s

VariableV2
ref"dtype�"
shapeshape"
dtypetype"
	containerstring "
shared_namestring �"serve*1.13.12
b'unknown'��
g
userPlaceholder*
dtype0*'
_output_shapes
:���������*
shape:���������
q
 embedding_1/random_uniform/shapeConst*
valueB"�o  2   *
dtype0*
_output_shapes
:
c
embedding_1/random_uniform/minConst*
_output_shapes
: *
valueB
 *��L�*
dtype0
c
embedding_1/random_uniform/maxConst*
valueB
 *��L=*
dtype0*
_output_shapes
: 
�
(embedding_1/random_uniform/RandomUniformRandomUniform embedding_1/random_uniform/shape*
T0*
dtype0* 
_output_shapes
:
��2*
seed2�á*
seed���)
�
embedding_1/random_uniform/subSubembedding_1/random_uniform/maxembedding_1/random_uniform/min*
_output_shapes
: *
T0
�
embedding_1/random_uniform/mulMul(embedding_1/random_uniform/RandomUniformembedding_1/random_uniform/sub*
T0* 
_output_shapes
:
��2
�
embedding_1/random_uniformAddembedding_1/random_uniform/mulembedding_1/random_uniform/min* 
_output_shapes
:
��2*
T0
�
embedding_1/embeddings
VariableV2* 
_output_shapes
:
��2*
	container *
shape:
��2*
shared_name *
dtype0
�
embedding_1/embeddings/AssignAssignembedding_1/embeddingsembedding_1/random_uniform*
use_locking(*
T0*)
_class
loc:@embedding_1/embeddings*
validate_shape(* 
_output_shapes
:
��2
�
embedding_1/embeddings/readIdentityembedding_1/embeddings* 
_output_shapes
:
��2*
T0*)
_class
loc:@embedding_1/embeddings
o
embedding_1/CastCastuser*

SrcT0*
Truncate( *'
_output_shapes
:���������*

DstT0
�
!embedding_1/embedding_lookup/axisConst*
_output_shapes
: *
value	B : *)
_class
loc:@embedding_1/embeddings*
dtype0
�
embedding_1/embedding_lookupGatherV2embedding_1/embeddings/readembedding_1/Cast!embedding_1/embedding_lookup/axis*+
_output_shapes
:���������2*
Taxis0*
Tindices0*
Tparams0*)
_class
loc:@embedding_1/embeddings
�
%embedding_1/embedding_lookup/IdentityIdentityembedding_1/embedding_lookup*+
_output_shapes
:���������2*
T0
t
reshape_1/ShapeShape%embedding_1/embedding_lookup/Identity*
_output_shapes
:*
T0*
out_type0
g
reshape_1/strided_slice/stackConst*
_output_shapes
:*
valueB: *
dtype0
i
reshape_1/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
i
reshape_1/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
reshape_1/strided_sliceStridedSlicereshape_1/Shapereshape_1/strided_slice/stackreshape_1/strided_slice/stack_1reshape_1/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
[
reshape_1/Reshape/shape/1Const*
value	B :2*
dtype0*
_output_shapes
: 
�
reshape_1/Reshape/shapePackreshape_1/strided_slicereshape_1/Reshape/shape/1*
_output_shapes
:*
T0*

axis *
N
�
reshape_1/ReshapeReshape%embedding_1/embedding_lookup/Identityreshape_1/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:���������2
j
productPlaceholder*
dtype0*'
_output_shapes
:���������*
shape:���������
q
 embedding_2/random_uniform/shapeConst*
valueB",  2   *
dtype0*
_output_shapes
:
c
embedding_2/random_uniform/minConst*
_output_shapes
: *
valueB
 *��L�*
dtype0
c
embedding_2/random_uniform/maxConst*
valueB
 *��L=*
dtype0*
_output_shapes
: 
�
(embedding_2/random_uniform/RandomUniformRandomUniform embedding_2/random_uniform/shape*
_output_shapes
:	�2*
seed2ħ�*
seed���)*
T0*
dtype0
�
embedding_2/random_uniform/subSubembedding_2/random_uniform/maxembedding_2/random_uniform/min*
_output_shapes
: *
T0
�
embedding_2/random_uniform/mulMul(embedding_2/random_uniform/RandomUniformembedding_2/random_uniform/sub*
_output_shapes
:	�2*
T0
�
embedding_2/random_uniformAddembedding_2/random_uniform/mulembedding_2/random_uniform/min*
_output_shapes
:	�2*
T0
�
embedding_2/embeddings
VariableV2*
_output_shapes
:	�2*
	container *
shape:	�2*
shared_name *
dtype0
�
embedding_2/embeddings/AssignAssignembedding_2/embeddingsembedding_2/random_uniform*
_output_shapes
:	�2*
use_locking(*
T0*)
_class
loc:@embedding_2/embeddings*
validate_shape(
�
embedding_2/embeddings/readIdentityembedding_2/embeddings*
_output_shapes
:	�2*
T0*)
_class
loc:@embedding_2/embeddings
r
embedding_2/CastCastproduct*'
_output_shapes
:���������*

DstT0*

SrcT0*
Truncate( 
�
!embedding_2/embedding_lookup/axisConst*
value	B : *)
_class
loc:@embedding_2/embeddings*
dtype0*
_output_shapes
: 
�
embedding_2/embedding_lookupGatherV2embedding_2/embeddings/readembedding_2/Cast!embedding_2/embedding_lookup/axis*+
_output_shapes
:���������2*
Taxis0*
Tindices0*
Tparams0*)
_class
loc:@embedding_2/embeddings
�
%embedding_2/embedding_lookup/IdentityIdentityembedding_2/embedding_lookup*
T0*+
_output_shapes
:���������2
t
reshape_2/ShapeShape%embedding_2/embedding_lookup/Identity*
_output_shapes
:*
T0*
out_type0
g
reshape_2/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
i
reshape_2/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
i
reshape_2/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
reshape_2/strided_sliceStridedSlicereshape_2/Shapereshape_2/strided_slice/stackreshape_2/strided_slice/stack_1reshape_2/strided_slice/stack_2*
_output_shapes
: *
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
[
reshape_2/Reshape/shape/1Const*
_output_shapes
: *
value	B :2*
dtype0
�
reshape_2/Reshape/shapePackreshape_2/strided_slicereshape_2/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
�
reshape_2/ReshapeReshape%embedding_2/embedding_lookup/Identityreshape_2/Reshape/shape*'
_output_shapes
:���������2*
T0*
Tshape0
[
concatenate_1/concat/axisConst*
_output_shapes
: *
value	B :*
dtype0
�
concatenate_1/concatConcatV2reshape_1/Reshapereshape_2/Reshapeconcatenate_1/concat/axis*'
_output_shapes
:���������d*

Tidx0*
T0*
N
T
dropout_1/mul/yConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
m
dropout_1/mulMulconcatenate_1/concatdropout_1/mul/y*
T0*'
_output_shapes
:���������d
[
dropout_1/dropout/rateConst*
valueB
 *��L>*
dtype0*
_output_shapes
: 
d
dropout_1/dropout/ShapeShapedropout_1/mul*
_output_shapes
:*
T0*
out_type0
\
dropout_1/dropout/sub/xConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
n
dropout_1/dropout/subSubdropout_1/dropout/sub/xdropout_1/dropout/rate*
T0*
_output_shapes
: 
i
$dropout_1/dropout/random_uniform/minConst*
_output_shapes
: *
valueB
 *    *
dtype0
i
$dropout_1/dropout/random_uniform/maxConst*
_output_shapes
: *
valueB
 *  �?*
dtype0
�
.dropout_1/dropout/random_uniform/RandomUniformRandomUniformdropout_1/dropout/Shape*
T0*
dtype0*'
_output_shapes
:���������d*
seed2��
*
seed���)
�
$dropout_1/dropout/random_uniform/subSub$dropout_1/dropout/random_uniform/max$dropout_1/dropout/random_uniform/min*
_output_shapes
: *
T0
�
$dropout_1/dropout/random_uniform/mulMul.dropout_1/dropout/random_uniform/RandomUniform$dropout_1/dropout/random_uniform/sub*'
_output_shapes
:���������d*
T0
�
 dropout_1/dropout/random_uniformAdd$dropout_1/dropout/random_uniform/mul$dropout_1/dropout/random_uniform/min*'
_output_shapes
:���������d*
T0
�
dropout_1/dropout/addAdddropout_1/dropout/sub dropout_1/dropout/random_uniform*'
_output_shapes
:���������d*
T0
i
dropout_1/dropout/FloorFloordropout_1/dropout/add*'
_output_shapes
:���������d*
T0
|
dropout_1/dropout/truedivRealDivdropout_1/muldropout_1/dropout/sub*
T0*'
_output_shapes
:���������d
�
dropout_1/dropout/mulMuldropout_1/dropout/truedivdropout_1/dropout/Floor*
T0*'
_output_shapes
:���������d
m
dense_1/random_uniform/shapeConst*
_output_shapes
:*
valueB"d   2   *
dtype0
_
dense_1/random_uniform/minConst*
_output_shapes
: *
valueB
 *��L�*
dtype0
_
dense_1/random_uniform/maxConst*
_output_shapes
: *
valueB
 *��L>*
dtype0
�
$dense_1/random_uniform/RandomUniformRandomUniformdense_1/random_uniform/shape*
_output_shapes

:d2*
seed2��*
seed���)*
T0*
dtype0
z
dense_1/random_uniform/subSubdense_1/random_uniform/maxdense_1/random_uniform/min*
T0*
_output_shapes
: 
�
dense_1/random_uniform/mulMul$dense_1/random_uniform/RandomUniformdense_1/random_uniform/sub*
_output_shapes

:d2*
T0
~
dense_1/random_uniformAdddense_1/random_uniform/muldense_1/random_uniform/min*
_output_shapes

:d2*
T0
�
dense_1/kernel
VariableV2*
_output_shapes

:d2*
	container *
shape
:d2*
shared_name *
dtype0
�
dense_1/kernel/AssignAssigndense_1/kerneldense_1/random_uniform*
_output_shapes

:d2*
use_locking(*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(
{
dense_1/kernel/readIdentitydense_1/kernel*
_output_shapes

:d2*
T0*!
_class
loc:@dense_1/kernel
Z
dense_1/ConstConst*
valueB2*    *
dtype0*
_output_shapes
:2
x
dense_1/bias
VariableV2*
shared_name *
dtype0*
_output_shapes
:2*
	container *
shape:2
�
dense_1/bias/AssignAssigndense_1/biasdense_1/Const*
_output_shapes
:2*
use_locking(*
T0*
_class
loc:@dense_1/bias*
validate_shape(
q
dense_1/bias/readIdentitydense_1/bias*
T0*
_class
loc:@dense_1/bias*
_output_shapes
:2
�
dense_1/MatMulMatMuldropout_1/dropout/muldense_1/kernel/read*
T0*'
_output_shapes
:���������2*
transpose_a( *
transpose_b( 
�
dense_1/BiasAddBiasAdddense_1/MatMuldense_1/bias/read*
T0*
data_formatNHWC*'
_output_shapes
:���������2
\
activation_1/ReluReludense_1/BiasAdd*
T0*'
_output_shapes
:���������2
T
dropout_2/mul/yConst*
_output_shapes
: *
valueB
 *  �?*
dtype0
j
dropout_2/mulMulactivation_1/Reludropout_2/mul/y*
T0*'
_output_shapes
:���������2
[
dropout_2/dropout/rateConst*
dtype0*
_output_shapes
: *
valueB
 *��L>
d
dropout_2/dropout/ShapeShapedropout_2/mul*
_output_shapes
:*
T0*
out_type0
\
dropout_2/dropout/sub/xConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
n
dropout_2/dropout/subSubdropout_2/dropout/sub/xdropout_2/dropout/rate*
T0*
_output_shapes
: 
i
$dropout_2/dropout/random_uniform/minConst*
valueB
 *    *
dtype0*
_output_shapes
: 
i
$dropout_2/dropout/random_uniform/maxConst*
_output_shapes
: *
valueB
 *  �?*
dtype0
�
.dropout_2/dropout/random_uniform/RandomUniformRandomUniformdropout_2/dropout/Shape*
dtype0*'
_output_shapes
:���������2*
seed2�@*
seed���)*
T0
�
$dropout_2/dropout/random_uniform/subSub$dropout_2/dropout/random_uniform/max$dropout_2/dropout/random_uniform/min*
T0*
_output_shapes
: 
�
$dropout_2/dropout/random_uniform/mulMul.dropout_2/dropout/random_uniform/RandomUniform$dropout_2/dropout/random_uniform/sub*
T0*'
_output_shapes
:���������2
�
 dropout_2/dropout/random_uniformAdd$dropout_2/dropout/random_uniform/mul$dropout_2/dropout/random_uniform/min*'
_output_shapes
:���������2*
T0
�
dropout_2/dropout/addAdddropout_2/dropout/sub dropout_2/dropout/random_uniform*'
_output_shapes
:���������2*
T0
i
dropout_2/dropout/FloorFloordropout_2/dropout/add*'
_output_shapes
:���������2*
T0
|
dropout_2/dropout/truedivRealDivdropout_2/muldropout_2/dropout/sub*'
_output_shapes
:���������2*
T0
�
dropout_2/dropout/mulMuldropout_2/dropout/truedivdropout_2/dropout/Floor*'
_output_shapes
:���������2*
T0
m
dense_2/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"2      
_
dense_2/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *S���
_
dense_2/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *S��>
�
$dense_2/random_uniform/RandomUniformRandomUniformdense_2/random_uniform/shape*
T0*
dtype0*
_output_shapes

:2*
seed2��*
seed���)
z
dense_2/random_uniform/subSubdense_2/random_uniform/maxdense_2/random_uniform/min*
T0*
_output_shapes
: 
�
dense_2/random_uniform/mulMul$dense_2/random_uniform/RandomUniformdense_2/random_uniform/sub*
T0*
_output_shapes

:2
~
dense_2/random_uniformAdddense_2/random_uniform/muldense_2/random_uniform/min*
T0*
_output_shapes

:2
�
dense_2/kernel
VariableV2*
shared_name *
dtype0*
_output_shapes

:2*
	container *
shape
:2
�
dense_2/kernel/AssignAssigndense_2/kerneldense_2/random_uniform*
use_locking(*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(*
_output_shapes

:2
{
dense_2/kernel/readIdentitydense_2/kernel*
_output_shapes

:2*
T0*!
_class
loc:@dense_2/kernel
Z
dense_2/ConstConst*
valueB*    *
dtype0*
_output_shapes
:
x
dense_2/bias
VariableV2*
shape:*
shared_name *
dtype0*
_output_shapes
:*
	container 
�
dense_2/bias/AssignAssigndense_2/biasdense_2/Const*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@dense_2/bias*
validate_shape(
q
dense_2/bias/readIdentitydense_2/bias*
_output_shapes
:*
T0*
_class
loc:@dense_2/bias
�
dense_2/MatMulMatMuldropout_2/dropout/muldense_2/kernel/read*
T0*'
_output_shapes
:���������*
transpose_a( *
transpose_b( 
�
dense_2/BiasAddBiasAdddense_2/MatMuldense_2/bias/read*
T0*
data_formatNHWC*'
_output_shapes
:���������
_
Adam/iterations/initial_valueConst*
_output_shapes
: *
value	B	 R *
dtype0	
s
Adam/iterations
VariableV2*
shape: *
shared_name *
dtype0	*
_output_shapes
: *
	container 
�
Adam/iterations/AssignAssignAdam/iterationsAdam/iterations/initial_value*"
_class
loc:@Adam/iterations*
validate_shape(*
_output_shapes
: *
use_locking(*
T0	
v
Adam/iterations/readIdentityAdam/iterations*
T0	*"
_class
loc:@Adam/iterations*
_output_shapes
: 
Z
Adam/lr/initial_valueConst*
dtype0*
_output_shapes
: *
valueB
 *o�:
k
Adam/lr
VariableV2*
_output_shapes
: *
	container *
shape: *
shared_name *
dtype0
�
Adam/lr/AssignAssignAdam/lrAdam/lr/initial_value*
use_locking(*
T0*
_class
loc:@Adam/lr*
validate_shape(*
_output_shapes
: 
^
Adam/lr/readIdentityAdam/lr*
T0*
_class
loc:@Adam/lr*
_output_shapes
: 
^
Adam/beta_1/initial_valueConst*
valueB
 *fff?*
dtype0*
_output_shapes
: 
o
Adam/beta_1
VariableV2*
shared_name *
dtype0*
_output_shapes
: *
	container *
shape: 
�
Adam/beta_1/AssignAssignAdam/beta_1Adam/beta_1/initial_value*
T0*
_class
loc:@Adam/beta_1*
validate_shape(*
_output_shapes
: *
use_locking(
j
Adam/beta_1/readIdentityAdam/beta_1*
T0*
_class
loc:@Adam/beta_1*
_output_shapes
: 
^
Adam/beta_2/initial_valueConst*
valueB
 *w�?*
dtype0*
_output_shapes
: 
o
Adam/beta_2
VariableV2*
shape: *
shared_name *
dtype0*
_output_shapes
: *
	container 
�
Adam/beta_2/AssignAssignAdam/beta_2Adam/beta_2/initial_value*
_output_shapes
: *
use_locking(*
T0*
_class
loc:@Adam/beta_2*
validate_shape(
j
Adam/beta_2/readIdentityAdam/beta_2*
T0*
_class
loc:@Adam/beta_2*
_output_shapes
: 
]
Adam/decay/initial_valueConst*
valueB
 *    *
dtype0*
_output_shapes
: 
n

Adam/decay
VariableV2*
_output_shapes
: *
	container *
shape: *
shared_name *
dtype0
�
Adam/decay/AssignAssign
Adam/decayAdam/decay/initial_value*
use_locking(*
T0*
_class
loc:@Adam/decay*
validate_shape(*
_output_shapes
: 
g
Adam/decay/readIdentity
Adam/decay*
T0*
_class
loc:@Adam/decay*
_output_shapes
: 
�
dense_2_targetPlaceholder*
dtype0*0
_output_shapes
:������������������*%
shape:������������������
q
dense_2_sample_weightsPlaceholder*
dtype0*#
_output_shapes
:���������*
shape:���������
\
loss/dense_2_loss/ConstConst*
valueB
 *���3*
dtype0*
_output_shapes
: 
^
loss/dense_2_loss/Const_1Const*
valueB
 *  �*
dtype0*
_output_shapes
: 
�
'loss/dense_2_loss/clip_by_value/MinimumMinimumdense_2/BiasAddloss/dense_2_loss/Const_1*'
_output_shapes
:���������*
T0
�
loss/dense_2_loss/clip_by_valueMaximum'loss/dense_2_loss/clip_by_value/Minimumloss/dense_2_loss/Const*
T0*'
_output_shapes
:���������
\
loss/dense_2_loss/add/yConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
�
loss/dense_2_loss/addAddloss/dense_2_loss/clip_by_valueloss/dense_2_loss/add/y*'
_output_shapes
:���������*
T0
e
loss/dense_2_loss/LogLogloss/dense_2_loss/add*'
_output_shapes
:���������*
T0
^
loss/dense_2_loss/Const_2Const*
valueB
 *���3*
dtype0*
_output_shapes
: 
^
loss/dense_2_loss/Const_3Const*
valueB
 *  �*
dtype0*
_output_shapes
: 
�
)loss/dense_2_loss/clip_by_value_1/MinimumMinimumdense_2_targetloss/dense_2_loss/Const_3*0
_output_shapes
:������������������*
T0
�
!loss/dense_2_loss/clip_by_value_1Maximum)loss/dense_2_loss/clip_by_value_1/Minimumloss/dense_2_loss/Const_2*0
_output_shapes
:������������������*
T0
^
loss/dense_2_loss/add_1/yConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
�
loss/dense_2_loss/add_1Add!loss/dense_2_loss/clip_by_value_1loss/dense_2_loss/add_1/y*0
_output_shapes
:������������������*
T0
r
loss/dense_2_loss/Log_1Logloss/dense_2_loss/add_1*
T0*0
_output_shapes
:������������������
�
loss/dense_2_loss/subSubloss/dense_2_loss/Logloss/dense_2_loss/Log_1*0
_output_shapes
:������������������*
T0
t
loss/dense_2_loss/SquareSquareloss/dense_2_loss/sub*0
_output_shapes
:������������������*
T0
s
(loss/dense_2_loss/Mean/reduction_indicesConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
loss/dense_2_loss/MeanMeanloss/dense_2_loss/Square(loss/dense_2_loss/Mean/reduction_indices*
T0*#
_output_shapes
:���������*
	keep_dims( *

Tidx0
m
*loss/dense_2_loss/Mean_1/reduction_indicesConst*
valueB *
dtype0*
_output_shapes
: 
�
loss/dense_2_loss/Mean_1Meanloss/dense_2_loss/Mean*loss/dense_2_loss/Mean_1/reduction_indices*
	keep_dims( *

Tidx0*
T0*#
_output_shapes
:���������
|
loss/dense_2_loss/mulMulloss/dense_2_loss/Mean_1dense_2_sample_weights*
T0*#
_output_shapes
:���������
a
loss/dense_2_loss/NotEqual/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
loss/dense_2_loss/NotEqualNotEqualdense_2_sample_weightsloss/dense_2_loss/NotEqual/y*
T0*#
_output_shapes
:���������
�
loss/dense_2_loss/CastCastloss/dense_2_loss/NotEqual*

SrcT0
*
Truncate( *#
_output_shapes
:���������*

DstT0
c
loss/dense_2_loss/Const_4Const*
_output_shapes
:*
valueB: *
dtype0
�
loss/dense_2_loss/Mean_2Meanloss/dense_2_loss/Castloss/dense_2_loss/Const_4*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
�
loss/dense_2_loss/truedivRealDivloss/dense_2_loss/mulloss/dense_2_loss/Mean_2*#
_output_shapes
:���������*
T0
c
loss/dense_2_loss/Const_5Const*
valueB: *
dtype0*
_output_shapes
:
�
loss/dense_2_loss/Mean_3Meanloss/dense_2_loss/truedivloss/dense_2_loss/Const_5*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
O

loss/mul/xConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
V
loss/mulMul
loss/mul/xloss/dense_2_loss/Mean_3*
T0*
_output_shapes
: 
}
training/Adam/gradients/ShapeConst*
valueB *
_class
loc:@loss/mul*
dtype0*
_output_shapes
: 
�
!training/Adam/gradients/grad_ys_0Const*
valueB
 *  �?*
_class
loc:@loss/mul*
dtype0*
_output_shapes
: 
�
training/Adam/gradients/FillFilltraining/Adam/gradients/Shape!training/Adam/gradients/grad_ys_0*
T0*

index_type0*
_class
loc:@loss/mul*
_output_shapes
: 
�
)training/Adam/gradients/loss/mul_grad/MulMultraining/Adam/gradients/Fillloss/dense_2_loss/Mean_3*
_class
loc:@loss/mul*
_output_shapes
: *
T0
�
+training/Adam/gradients/loss/mul_grad/Mul_1Multraining/Adam/gradients/Fill
loss/mul/x*
T0*
_class
loc:@loss/mul*
_output_shapes
: 
�
Ctraining/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Reshape/shapeConst*
valueB:*+
_class!
loc:@loss/dense_2_loss/Mean_3*
dtype0*
_output_shapes
:
�
=training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/ReshapeReshape+training/Adam/gradients/loss/mul_grad/Mul_1Ctraining/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Reshape/shape*
_output_shapes
:*
T0*
Tshape0*+
_class!
loc:@loss/dense_2_loss/Mean_3
�
;training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/ShapeShapeloss/dense_2_loss/truediv*
T0*
out_type0*+
_class!
loc:@loss/dense_2_loss/Mean_3*
_output_shapes
:
�
:training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/TileTile=training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Reshape;training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Shape*

Tmultiples0*
T0*+
_class!
loc:@loss/dense_2_loss/Mean_3*#
_output_shapes
:���������
�
=training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Shape_1Shapeloss/dense_2_loss/truediv*
out_type0*+
_class!
loc:@loss/dense_2_loss/Mean_3*
_output_shapes
:*
T0
�
=training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Shape_2Const*
valueB *+
_class!
loc:@loss/dense_2_loss/Mean_3*
dtype0*
_output_shapes
: 
�
;training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/ConstConst*
valueB: *+
_class!
loc:@loss/dense_2_loss/Mean_3*
dtype0*
_output_shapes
:
�
:training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/ProdProd=training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Shape_1;training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Const*

Tidx0*
	keep_dims( *
T0*+
_class!
loc:@loss/dense_2_loss/Mean_3*
_output_shapes
: 
�
=training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Const_1Const*
_output_shapes
:*
valueB: *+
_class!
loc:@loss/dense_2_loss/Mean_3*
dtype0
�
<training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Prod_1Prod=training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Shape_2=training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Const_1*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0*+
_class!
loc:@loss/dense_2_loss/Mean_3
�
?training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Maximum/yConst*
dtype0*
_output_shapes
: *
value	B :*+
_class!
loc:@loss/dense_2_loss/Mean_3
�
=training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/MaximumMaximum<training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Prod_1?training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Maximum/y*
T0*+
_class!
loc:@loss/dense_2_loss/Mean_3*
_output_shapes
: 
�
>training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/floordivFloorDiv:training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Prod=training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Maximum*
_output_shapes
: *
T0*+
_class!
loc:@loss/dense_2_loss/Mean_3
�
:training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/CastCast>training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/floordiv*

SrcT0*+
_class!
loc:@loss/dense_2_loss/Mean_3*
Truncate( *
_output_shapes
: *

DstT0
�
=training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/truedivRealDiv:training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Tile:training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/Cast*
T0*+
_class!
loc:@loss/dense_2_loss/Mean_3*#
_output_shapes
:���������
�
<training/Adam/gradients/loss/dense_2_loss/truediv_grad/ShapeShapeloss/dense_2_loss/mul*
T0*
out_type0*,
_class"
 loc:@loss/dense_2_loss/truediv*
_output_shapes
:
�
>training/Adam/gradients/loss/dense_2_loss/truediv_grad/Shape_1Const*
valueB *,
_class"
 loc:@loss/dense_2_loss/truediv*
dtype0*
_output_shapes
: 
�
Ltraining/Adam/gradients/loss/dense_2_loss/truediv_grad/BroadcastGradientArgsBroadcastGradientArgs<training/Adam/gradients/loss/dense_2_loss/truediv_grad/Shape>training/Adam/gradients/loss/dense_2_loss/truediv_grad/Shape_1*
T0*,
_class"
 loc:@loss/dense_2_loss/truediv*2
_output_shapes 
:���������:���������
�
>training/Adam/gradients/loss/dense_2_loss/truediv_grad/RealDivRealDiv=training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/truedivloss/dense_2_loss/Mean_2*,
_class"
 loc:@loss/dense_2_loss/truediv*#
_output_shapes
:���������*
T0
�
:training/Adam/gradients/loss/dense_2_loss/truediv_grad/SumSum>training/Adam/gradients/loss/dense_2_loss/truediv_grad/RealDivLtraining/Adam/gradients/loss/dense_2_loss/truediv_grad/BroadcastGradientArgs*
T0*,
_class"
 loc:@loss/dense_2_loss/truediv*
_output_shapes
:*

Tidx0*
	keep_dims( 
�
>training/Adam/gradients/loss/dense_2_loss/truediv_grad/ReshapeReshape:training/Adam/gradients/loss/dense_2_loss/truediv_grad/Sum<training/Adam/gradients/loss/dense_2_loss/truediv_grad/Shape*#
_output_shapes
:���������*
T0*
Tshape0*,
_class"
 loc:@loss/dense_2_loss/truediv
�
:training/Adam/gradients/loss/dense_2_loss/truediv_grad/NegNegloss/dense_2_loss/mul*
T0*,
_class"
 loc:@loss/dense_2_loss/truediv*#
_output_shapes
:���������
�
@training/Adam/gradients/loss/dense_2_loss/truediv_grad/RealDiv_1RealDiv:training/Adam/gradients/loss/dense_2_loss/truediv_grad/Negloss/dense_2_loss/Mean_2*
T0*,
_class"
 loc:@loss/dense_2_loss/truediv*#
_output_shapes
:���������
�
@training/Adam/gradients/loss/dense_2_loss/truediv_grad/RealDiv_2RealDiv@training/Adam/gradients/loss/dense_2_loss/truediv_grad/RealDiv_1loss/dense_2_loss/Mean_2*,
_class"
 loc:@loss/dense_2_loss/truediv*#
_output_shapes
:���������*
T0
�
:training/Adam/gradients/loss/dense_2_loss/truediv_grad/mulMul=training/Adam/gradients/loss/dense_2_loss/Mean_3_grad/truediv@training/Adam/gradients/loss/dense_2_loss/truediv_grad/RealDiv_2*#
_output_shapes
:���������*
T0*,
_class"
 loc:@loss/dense_2_loss/truediv
�
<training/Adam/gradients/loss/dense_2_loss/truediv_grad/Sum_1Sum:training/Adam/gradients/loss/dense_2_loss/truediv_grad/mulNtraining/Adam/gradients/loss/dense_2_loss/truediv_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0*,
_class"
 loc:@loss/dense_2_loss/truediv*
_output_shapes
:
�
@training/Adam/gradients/loss/dense_2_loss/truediv_grad/Reshape_1Reshape<training/Adam/gradients/loss/dense_2_loss/truediv_grad/Sum_1>training/Adam/gradients/loss/dense_2_loss/truediv_grad/Shape_1*
T0*
Tshape0*,
_class"
 loc:@loss/dense_2_loss/truediv*
_output_shapes
: 
�
8training/Adam/gradients/loss/dense_2_loss/mul_grad/ShapeShapeloss/dense_2_loss/Mean_1*
T0*
out_type0*(
_class
loc:@loss/dense_2_loss/mul*
_output_shapes
:
�
:training/Adam/gradients/loss/dense_2_loss/mul_grad/Shape_1Shapedense_2_sample_weights*
_output_shapes
:*
T0*
out_type0*(
_class
loc:@loss/dense_2_loss/mul
�
Htraining/Adam/gradients/loss/dense_2_loss/mul_grad/BroadcastGradientArgsBroadcastGradientArgs8training/Adam/gradients/loss/dense_2_loss/mul_grad/Shape:training/Adam/gradients/loss/dense_2_loss/mul_grad/Shape_1*
T0*(
_class
loc:@loss/dense_2_loss/mul*2
_output_shapes 
:���������:���������
�
6training/Adam/gradients/loss/dense_2_loss/mul_grad/MulMul>training/Adam/gradients/loss/dense_2_loss/truediv_grad/Reshapedense_2_sample_weights*(
_class
loc:@loss/dense_2_loss/mul*#
_output_shapes
:���������*
T0
�
6training/Adam/gradients/loss/dense_2_loss/mul_grad/SumSum6training/Adam/gradients/loss/dense_2_loss/mul_grad/MulHtraining/Adam/gradients/loss/dense_2_loss/mul_grad/BroadcastGradientArgs*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0*(
_class
loc:@loss/dense_2_loss/mul
�
:training/Adam/gradients/loss/dense_2_loss/mul_grad/ReshapeReshape6training/Adam/gradients/loss/dense_2_loss/mul_grad/Sum8training/Adam/gradients/loss/dense_2_loss/mul_grad/Shape*
T0*
Tshape0*(
_class
loc:@loss/dense_2_loss/mul*#
_output_shapes
:���������
�
8training/Adam/gradients/loss/dense_2_loss/mul_grad/Mul_1Mulloss/dense_2_loss/Mean_1>training/Adam/gradients/loss/dense_2_loss/truediv_grad/Reshape*
T0*(
_class
loc:@loss/dense_2_loss/mul*#
_output_shapes
:���������
�
8training/Adam/gradients/loss/dense_2_loss/mul_grad/Sum_1Sum8training/Adam/gradients/loss/dense_2_loss/mul_grad/Mul_1Jtraining/Adam/gradients/loss/dense_2_loss/mul_grad/BroadcastGradientArgs:1*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0*(
_class
loc:@loss/dense_2_loss/mul
�
<training/Adam/gradients/loss/dense_2_loss/mul_grad/Reshape_1Reshape8training/Adam/gradients/loss/dense_2_loss/mul_grad/Sum_1:training/Adam/gradients/loss/dense_2_loss/mul_grad/Shape_1*#
_output_shapes
:���������*
T0*
Tshape0*(
_class
loc:@loss/dense_2_loss/mul
�
;training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/ShapeShapeloss/dense_2_loss/Mean*
_output_shapes
:*
T0*
out_type0*+
_class!
loc:@loss/dense_2_loss/Mean_1
�
:training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/SizeConst*
value	B :*+
_class!
loc:@loss/dense_2_loss/Mean_1*
dtype0*
_output_shapes
: 
�
9training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/addAdd*loss/dense_2_loss/Mean_1/reduction_indices:training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Size*
_output_shapes
: *
T0*+
_class!
loc:@loss/dense_2_loss/Mean_1
�
9training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/modFloorMod9training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/add:training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Size*+
_class!
loc:@loss/dense_2_loss/Mean_1*
_output_shapes
: *
T0
�
=training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Shape_1Const*
_output_shapes
:*
valueB: *+
_class!
loc:@loss/dense_2_loss/Mean_1*
dtype0
�
Atraining/Adam/gradients/loss/dense_2_loss/Mean_1_grad/range/startConst*
value	B : *+
_class!
loc:@loss/dense_2_loss/Mean_1*
dtype0*
_output_shapes
: 
�
Atraining/Adam/gradients/loss/dense_2_loss/Mean_1_grad/range/deltaConst*
value	B :*+
_class!
loc:@loss/dense_2_loss/Mean_1*
dtype0*
_output_shapes
: 
�
;training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/rangeRangeAtraining/Adam/gradients/loss/dense_2_loss/Mean_1_grad/range/start:training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/SizeAtraining/Adam/gradients/loss/dense_2_loss/Mean_1_grad/range/delta*

Tidx0*+
_class!
loc:@loss/dense_2_loss/Mean_1*
_output_shapes
:
�
@training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Fill/valueConst*
value	B :*+
_class!
loc:@loss/dense_2_loss/Mean_1*
dtype0*
_output_shapes
: 
�
:training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/FillFill=training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Shape_1@training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Fill/value*

index_type0*+
_class!
loc:@loss/dense_2_loss/Mean_1*
_output_shapes
: *
T0
�
Ctraining/Adam/gradients/loss/dense_2_loss/Mean_1_grad/DynamicStitchDynamicStitch;training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/range9training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/mod;training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Shape:training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Fill*
T0*+
_class!
loc:@loss/dense_2_loss/Mean_1*
N*
_output_shapes
:
�
?training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Maximum/yConst*
value	B :*+
_class!
loc:@loss/dense_2_loss/Mean_1*
dtype0*
_output_shapes
: 
�
=training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/MaximumMaximumCtraining/Adam/gradients/loss/dense_2_loss/Mean_1_grad/DynamicStitch?training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Maximum/y*+
_class!
loc:@loss/dense_2_loss/Mean_1*
_output_shapes
:*
T0
�
>training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/floordivFloorDiv;training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Shape=training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Maximum*
T0*+
_class!
loc:@loss/dense_2_loss/Mean_1*
_output_shapes
:
�
=training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/ReshapeReshape:training/Adam/gradients/loss/dense_2_loss/mul_grad/ReshapeCtraining/Adam/gradients/loss/dense_2_loss/Mean_1_grad/DynamicStitch*
T0*
Tshape0*+
_class!
loc:@loss/dense_2_loss/Mean_1*#
_output_shapes
:���������
�
:training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/TileTile=training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Reshape>training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/floordiv*#
_output_shapes
:���������*

Tmultiples0*
T0*+
_class!
loc:@loss/dense_2_loss/Mean_1
�
=training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Shape_2Shapeloss/dense_2_loss/Mean*
T0*
out_type0*+
_class!
loc:@loss/dense_2_loss/Mean_1*
_output_shapes
:
�
=training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Shape_3Shapeloss/dense_2_loss/Mean_1*
T0*
out_type0*+
_class!
loc:@loss/dense_2_loss/Mean_1*
_output_shapes
:
�
;training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/ConstConst*
valueB: *+
_class!
loc:@loss/dense_2_loss/Mean_1*
dtype0*
_output_shapes
:
�
:training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/ProdProd=training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Shape_2;training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0*+
_class!
loc:@loss/dense_2_loss/Mean_1
�
=training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Const_1Const*
_output_shapes
:*
valueB: *+
_class!
loc:@loss/dense_2_loss/Mean_1*
dtype0
�
<training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Prod_1Prod=training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Shape_3=training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Const_1*+
_class!
loc:@loss/dense_2_loss/Mean_1*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0
�
Atraining/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Maximum_1/yConst*
value	B :*+
_class!
loc:@loss/dense_2_loss/Mean_1*
dtype0*
_output_shapes
: 
�
?training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Maximum_1Maximum<training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Prod_1Atraining/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Maximum_1/y*
T0*+
_class!
loc:@loss/dense_2_loss/Mean_1*
_output_shapes
: 
�
@training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/floordiv_1FloorDiv:training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Prod?training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Maximum_1*
T0*+
_class!
loc:@loss/dense_2_loss/Mean_1*
_output_shapes
: 
�
:training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/CastCast@training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/floordiv_1*

SrcT0*+
_class!
loc:@loss/dense_2_loss/Mean_1*
Truncate( *
_output_shapes
: *

DstT0
�
=training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/truedivRealDiv:training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Tile:training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/Cast*
T0*+
_class!
loc:@loss/dense_2_loss/Mean_1*#
_output_shapes
:���������
�
9training/Adam/gradients/loss/dense_2_loss/Mean_grad/ShapeShapeloss/dense_2_loss/Square*
T0*
out_type0*)
_class
loc:@loss/dense_2_loss/Mean*
_output_shapes
:
�
8training/Adam/gradients/loss/dense_2_loss/Mean_grad/SizeConst*
value	B :*)
_class
loc:@loss/dense_2_loss/Mean*
dtype0*
_output_shapes
: 
�
7training/Adam/gradients/loss/dense_2_loss/Mean_grad/addAdd(loss/dense_2_loss/Mean/reduction_indices8training/Adam/gradients/loss/dense_2_loss/Mean_grad/Size*
_output_shapes
: *
T0*)
_class
loc:@loss/dense_2_loss/Mean
�
7training/Adam/gradients/loss/dense_2_loss/Mean_grad/modFloorMod7training/Adam/gradients/loss/dense_2_loss/Mean_grad/add8training/Adam/gradients/loss/dense_2_loss/Mean_grad/Size*
_output_shapes
: *
T0*)
_class
loc:@loss/dense_2_loss/Mean
�
;training/Adam/gradients/loss/dense_2_loss/Mean_grad/Shape_1Const*
valueB *)
_class
loc:@loss/dense_2_loss/Mean*
dtype0*
_output_shapes
: 
�
?training/Adam/gradients/loss/dense_2_loss/Mean_grad/range/startConst*
value	B : *)
_class
loc:@loss/dense_2_loss/Mean*
dtype0*
_output_shapes
: 
�
?training/Adam/gradients/loss/dense_2_loss/Mean_grad/range/deltaConst*
value	B :*)
_class
loc:@loss/dense_2_loss/Mean*
dtype0*
_output_shapes
: 
�
9training/Adam/gradients/loss/dense_2_loss/Mean_grad/rangeRange?training/Adam/gradients/loss/dense_2_loss/Mean_grad/range/start8training/Adam/gradients/loss/dense_2_loss/Mean_grad/Size?training/Adam/gradients/loss/dense_2_loss/Mean_grad/range/delta*

Tidx0*)
_class
loc:@loss/dense_2_loss/Mean*
_output_shapes
:
�
>training/Adam/gradients/loss/dense_2_loss/Mean_grad/Fill/valueConst*
value	B :*)
_class
loc:@loss/dense_2_loss/Mean*
dtype0*
_output_shapes
: 
�
8training/Adam/gradients/loss/dense_2_loss/Mean_grad/FillFill;training/Adam/gradients/loss/dense_2_loss/Mean_grad/Shape_1>training/Adam/gradients/loss/dense_2_loss/Mean_grad/Fill/value*
T0*

index_type0*)
_class
loc:@loss/dense_2_loss/Mean*
_output_shapes
: 
�
Atraining/Adam/gradients/loss/dense_2_loss/Mean_grad/DynamicStitchDynamicStitch9training/Adam/gradients/loss/dense_2_loss/Mean_grad/range7training/Adam/gradients/loss/dense_2_loss/Mean_grad/mod9training/Adam/gradients/loss/dense_2_loss/Mean_grad/Shape8training/Adam/gradients/loss/dense_2_loss/Mean_grad/Fill*
_output_shapes
:*
T0*)
_class
loc:@loss/dense_2_loss/Mean*
N
�
=training/Adam/gradients/loss/dense_2_loss/Mean_grad/Maximum/yConst*
value	B :*)
_class
loc:@loss/dense_2_loss/Mean*
dtype0*
_output_shapes
: 
�
;training/Adam/gradients/loss/dense_2_loss/Mean_grad/MaximumMaximumAtraining/Adam/gradients/loss/dense_2_loss/Mean_grad/DynamicStitch=training/Adam/gradients/loss/dense_2_loss/Mean_grad/Maximum/y*
T0*)
_class
loc:@loss/dense_2_loss/Mean*
_output_shapes
:
�
<training/Adam/gradients/loss/dense_2_loss/Mean_grad/floordivFloorDiv9training/Adam/gradients/loss/dense_2_loss/Mean_grad/Shape;training/Adam/gradients/loss/dense_2_loss/Mean_grad/Maximum*
T0*)
_class
loc:@loss/dense_2_loss/Mean*
_output_shapes
:
�
;training/Adam/gradients/loss/dense_2_loss/Mean_grad/ReshapeReshape=training/Adam/gradients/loss/dense_2_loss/Mean_1_grad/truedivAtraining/Adam/gradients/loss/dense_2_loss/Mean_grad/DynamicStitch*
T0*
Tshape0*)
_class
loc:@loss/dense_2_loss/Mean*0
_output_shapes
:������������������
�
8training/Adam/gradients/loss/dense_2_loss/Mean_grad/TileTile;training/Adam/gradients/loss/dense_2_loss/Mean_grad/Reshape<training/Adam/gradients/loss/dense_2_loss/Mean_grad/floordiv*0
_output_shapes
:������������������*

Tmultiples0*
T0*)
_class
loc:@loss/dense_2_loss/Mean
�
;training/Adam/gradients/loss/dense_2_loss/Mean_grad/Shape_2Shapeloss/dense_2_loss/Square*
_output_shapes
:*
T0*
out_type0*)
_class
loc:@loss/dense_2_loss/Mean
�
;training/Adam/gradients/loss/dense_2_loss/Mean_grad/Shape_3Shapeloss/dense_2_loss/Mean*
T0*
out_type0*)
_class
loc:@loss/dense_2_loss/Mean*
_output_shapes
:
�
9training/Adam/gradients/loss/dense_2_loss/Mean_grad/ConstConst*
valueB: *)
_class
loc:@loss/dense_2_loss/Mean*
dtype0*
_output_shapes
:
�
8training/Adam/gradients/loss/dense_2_loss/Mean_grad/ProdProd;training/Adam/gradients/loss/dense_2_loss/Mean_grad/Shape_29training/Adam/gradients/loss/dense_2_loss/Mean_grad/Const*
T0*)
_class
loc:@loss/dense_2_loss/Mean*
_output_shapes
: *

Tidx0*
	keep_dims( 
�
;training/Adam/gradients/loss/dense_2_loss/Mean_grad/Const_1Const*
valueB: *)
_class
loc:@loss/dense_2_loss/Mean*
dtype0*
_output_shapes
:
�
:training/Adam/gradients/loss/dense_2_loss/Mean_grad/Prod_1Prod;training/Adam/gradients/loss/dense_2_loss/Mean_grad/Shape_3;training/Adam/gradients/loss/dense_2_loss/Mean_grad/Const_1*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0*)
_class
loc:@loss/dense_2_loss/Mean
�
?training/Adam/gradients/loss/dense_2_loss/Mean_grad/Maximum_1/yConst*
value	B :*)
_class
loc:@loss/dense_2_loss/Mean*
dtype0*
_output_shapes
: 
�
=training/Adam/gradients/loss/dense_2_loss/Mean_grad/Maximum_1Maximum:training/Adam/gradients/loss/dense_2_loss/Mean_grad/Prod_1?training/Adam/gradients/loss/dense_2_loss/Mean_grad/Maximum_1/y*
T0*)
_class
loc:@loss/dense_2_loss/Mean*
_output_shapes
: 
�
>training/Adam/gradients/loss/dense_2_loss/Mean_grad/floordiv_1FloorDiv8training/Adam/gradients/loss/dense_2_loss/Mean_grad/Prod=training/Adam/gradients/loss/dense_2_loss/Mean_grad/Maximum_1*
_output_shapes
: *
T0*)
_class
loc:@loss/dense_2_loss/Mean
�
8training/Adam/gradients/loss/dense_2_loss/Mean_grad/CastCast>training/Adam/gradients/loss/dense_2_loss/Mean_grad/floordiv_1*)
_class
loc:@loss/dense_2_loss/Mean*
Truncate( *
_output_shapes
: *

DstT0*

SrcT0
�
;training/Adam/gradients/loss/dense_2_loss/Mean_grad/truedivRealDiv8training/Adam/gradients/loss/dense_2_loss/Mean_grad/Tile8training/Adam/gradients/loss/dense_2_loss/Mean_grad/Cast*0
_output_shapes
:������������������*
T0*)
_class
loc:@loss/dense_2_loss/Mean
�
;training/Adam/gradients/loss/dense_2_loss/Square_grad/ConstConst<^training/Adam/gradients/loss/dense_2_loss/Mean_grad/truediv*
valueB
 *   @*+
_class!
loc:@loss/dense_2_loss/Square*
dtype0*
_output_shapes
: 
�
9training/Adam/gradients/loss/dense_2_loss/Square_grad/MulMulloss/dense_2_loss/sub;training/Adam/gradients/loss/dense_2_loss/Square_grad/Const*+
_class!
loc:@loss/dense_2_loss/Square*0
_output_shapes
:������������������*
T0
�
;training/Adam/gradients/loss/dense_2_loss/Square_grad/Mul_1Mul;training/Adam/gradients/loss/dense_2_loss/Mean_grad/truediv9training/Adam/gradients/loss/dense_2_loss/Square_grad/Mul*0
_output_shapes
:������������������*
T0*+
_class!
loc:@loss/dense_2_loss/Square
�
8training/Adam/gradients/loss/dense_2_loss/sub_grad/ShapeShapeloss/dense_2_loss/Log*
_output_shapes
:*
T0*
out_type0*(
_class
loc:@loss/dense_2_loss/sub
�
:training/Adam/gradients/loss/dense_2_loss/sub_grad/Shape_1Shapeloss/dense_2_loss/Log_1*
out_type0*(
_class
loc:@loss/dense_2_loss/sub*
_output_shapes
:*
T0
�
Htraining/Adam/gradients/loss/dense_2_loss/sub_grad/BroadcastGradientArgsBroadcastGradientArgs8training/Adam/gradients/loss/dense_2_loss/sub_grad/Shape:training/Adam/gradients/loss/dense_2_loss/sub_grad/Shape_1*
T0*(
_class
loc:@loss/dense_2_loss/sub*2
_output_shapes 
:���������:���������
�
6training/Adam/gradients/loss/dense_2_loss/sub_grad/SumSum;training/Adam/gradients/loss/dense_2_loss/Square_grad/Mul_1Htraining/Adam/gradients/loss/dense_2_loss/sub_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0*(
_class
loc:@loss/dense_2_loss/sub*
_output_shapes
:
�
:training/Adam/gradients/loss/dense_2_loss/sub_grad/ReshapeReshape6training/Adam/gradients/loss/dense_2_loss/sub_grad/Sum8training/Adam/gradients/loss/dense_2_loss/sub_grad/Shape*
Tshape0*(
_class
loc:@loss/dense_2_loss/sub*'
_output_shapes
:���������*
T0
�
8training/Adam/gradients/loss/dense_2_loss/sub_grad/Sum_1Sum;training/Adam/gradients/loss/dense_2_loss/Square_grad/Mul_1Jtraining/Adam/gradients/loss/dense_2_loss/sub_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0*(
_class
loc:@loss/dense_2_loss/sub*
_output_shapes
:
�
6training/Adam/gradients/loss/dense_2_loss/sub_grad/NegNeg8training/Adam/gradients/loss/dense_2_loss/sub_grad/Sum_1*
T0*(
_class
loc:@loss/dense_2_loss/sub*
_output_shapes
:
�
<training/Adam/gradients/loss/dense_2_loss/sub_grad/Reshape_1Reshape6training/Adam/gradients/loss/dense_2_loss/sub_grad/Neg:training/Adam/gradients/loss/dense_2_loss/sub_grad/Shape_1*0
_output_shapes
:������������������*
T0*
Tshape0*(
_class
loc:@loss/dense_2_loss/sub
�
=training/Adam/gradients/loss/dense_2_loss/Log_grad/Reciprocal
Reciprocalloss/dense_2_loss/add;^training/Adam/gradients/loss/dense_2_loss/sub_grad/Reshape*
T0*(
_class
loc:@loss/dense_2_loss/Log*'
_output_shapes
:���������
�
6training/Adam/gradients/loss/dense_2_loss/Log_grad/mulMul:training/Adam/gradients/loss/dense_2_loss/sub_grad/Reshape=training/Adam/gradients/loss/dense_2_loss/Log_grad/Reciprocal*
T0*(
_class
loc:@loss/dense_2_loss/Log*'
_output_shapes
:���������
�
8training/Adam/gradients/loss/dense_2_loss/add_grad/ShapeShapeloss/dense_2_loss/clip_by_value*
T0*
out_type0*(
_class
loc:@loss/dense_2_loss/add*
_output_shapes
:
�
:training/Adam/gradients/loss/dense_2_loss/add_grad/Shape_1Const*
valueB *(
_class
loc:@loss/dense_2_loss/add*
dtype0*
_output_shapes
: 
�
Htraining/Adam/gradients/loss/dense_2_loss/add_grad/BroadcastGradientArgsBroadcastGradientArgs8training/Adam/gradients/loss/dense_2_loss/add_grad/Shape:training/Adam/gradients/loss/dense_2_loss/add_grad/Shape_1*
T0*(
_class
loc:@loss/dense_2_loss/add*2
_output_shapes 
:���������:���������
�
6training/Adam/gradients/loss/dense_2_loss/add_grad/SumSum6training/Adam/gradients/loss/dense_2_loss/Log_grad/mulHtraining/Adam/gradients/loss/dense_2_loss/add_grad/BroadcastGradientArgs*(
_class
loc:@loss/dense_2_loss/add*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0
�
:training/Adam/gradients/loss/dense_2_loss/add_grad/ReshapeReshape6training/Adam/gradients/loss/dense_2_loss/add_grad/Sum8training/Adam/gradients/loss/dense_2_loss/add_grad/Shape*
T0*
Tshape0*(
_class
loc:@loss/dense_2_loss/add*'
_output_shapes
:���������
�
8training/Adam/gradients/loss/dense_2_loss/add_grad/Sum_1Sum6training/Adam/gradients/loss/dense_2_loss/Log_grad/mulJtraining/Adam/gradients/loss/dense_2_loss/add_grad/BroadcastGradientArgs:1*
T0*(
_class
loc:@loss/dense_2_loss/add*
_output_shapes
:*

Tidx0*
	keep_dims( 
�
<training/Adam/gradients/loss/dense_2_loss/add_grad/Reshape_1Reshape8training/Adam/gradients/loss/dense_2_loss/add_grad/Sum_1:training/Adam/gradients/loss/dense_2_loss/add_grad/Shape_1*
T0*
Tshape0*(
_class
loc:@loss/dense_2_loss/add*
_output_shapes
: 
�
Btraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/ShapeShape'loss/dense_2_loss/clip_by_value/Minimum*
_output_shapes
:*
T0*
out_type0*2
_class(
&$loc:@loss/dense_2_loss/clip_by_value
�
Dtraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/Shape_1Const*
valueB *2
_class(
&$loc:@loss/dense_2_loss/clip_by_value*
dtype0*
_output_shapes
: 
�
Dtraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/Shape_2Shape:training/Adam/gradients/loss/dense_2_loss/add_grad/Reshape*
T0*
out_type0*2
_class(
&$loc:@loss/dense_2_loss/clip_by_value*
_output_shapes
:
�
Htraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/zeros/ConstConst*
valueB
 *    *2
_class(
&$loc:@loss/dense_2_loss/clip_by_value*
dtype0*
_output_shapes
: 
�
Btraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/zerosFillDtraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/Shape_2Htraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/zeros/Const*
T0*

index_type0*2
_class(
&$loc:@loss/dense_2_loss/clip_by_value*'
_output_shapes
:���������
�
Itraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/GreaterEqualGreaterEqual'loss/dense_2_loss/clip_by_value/Minimumloss/dense_2_loss/Const*'
_output_shapes
:���������*
T0*2
_class(
&$loc:@loss/dense_2_loss/clip_by_value
�
Rtraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/BroadcastGradientArgsBroadcastGradientArgsBtraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/ShapeDtraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/Shape_1*2
_output_shapes 
:���������:���������*
T0*2
_class(
&$loc:@loss/dense_2_loss/clip_by_value
�
Ctraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/SelectSelectItraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/GreaterEqual:training/Adam/gradients/loss/dense_2_loss/add_grad/ReshapeBtraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/zeros*
T0*2
_class(
&$loc:@loss/dense_2_loss/clip_by_value*'
_output_shapes
:���������
�
Etraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/Select_1SelectItraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/GreaterEqualBtraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/zeros:training/Adam/gradients/loss/dense_2_loss/add_grad/Reshape*'
_output_shapes
:���������*
T0*2
_class(
&$loc:@loss/dense_2_loss/clip_by_value
�
@training/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/SumSumCtraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/SelectRtraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/BroadcastGradientArgs*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0*2
_class(
&$loc:@loss/dense_2_loss/clip_by_value
�
Dtraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/ReshapeReshape@training/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/SumBtraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/Shape*'
_output_shapes
:���������*
T0*
Tshape0*2
_class(
&$loc:@loss/dense_2_loss/clip_by_value
�
Btraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/Sum_1SumEtraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/Select_1Ttraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0*2
_class(
&$loc:@loss/dense_2_loss/clip_by_value*
_output_shapes
:
�
Ftraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/Reshape_1ReshapeBtraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/Sum_1Dtraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/Shape_1*
_output_shapes
: *
T0*
Tshape0*2
_class(
&$loc:@loss/dense_2_loss/clip_by_value
�
Jtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/ShapeShapedense_2/BiasAdd*
T0*
out_type0*:
_class0
.,loc:@loss/dense_2_loss/clip_by_value/Minimum*
_output_shapes
:
�
Ltraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Shape_1Const*
_output_shapes
: *
valueB *:
_class0
.,loc:@loss/dense_2_loss/clip_by_value/Minimum*
dtype0
�
Ltraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Shape_2ShapeDtraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/Reshape*
T0*
out_type0*:
_class0
.,loc:@loss/dense_2_loss/clip_by_value/Minimum*
_output_shapes
:
�
Ptraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/zeros/ConstConst*
valueB
 *    *:
_class0
.,loc:@loss/dense_2_loss/clip_by_value/Minimum*
dtype0*
_output_shapes
: 
�
Jtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/zerosFillLtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Shape_2Ptraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/zeros/Const*
T0*

index_type0*:
_class0
.,loc:@loss/dense_2_loss/clip_by_value/Minimum*'
_output_shapes
:���������
�
Ntraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/LessEqual	LessEqualdense_2/BiasAddloss/dense_2_loss/Const_1*
T0*:
_class0
.,loc:@loss/dense_2_loss/clip_by_value/Minimum*'
_output_shapes
:���������
�
Ztraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgsJtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/ShapeLtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Shape_1*
T0*:
_class0
.,loc:@loss/dense_2_loss/clip_by_value/Minimum*2
_output_shapes 
:���������:���������
�
Ktraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/SelectSelectNtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/LessEqualDtraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/ReshapeJtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/zeros*
T0*:
_class0
.,loc:@loss/dense_2_loss/clip_by_value/Minimum*'
_output_shapes
:���������
�
Mtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Select_1SelectNtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/LessEqualJtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/zerosDtraining/Adam/gradients/loss/dense_2_loss/clip_by_value_grad/Reshape*
T0*:
_class0
.,loc:@loss/dense_2_loss/clip_by_value/Minimum*'
_output_shapes
:���������
�
Htraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/SumSumKtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/SelectZtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/BroadcastGradientArgs*
T0*:
_class0
.,loc:@loss/dense_2_loss/clip_by_value/Minimum*
_output_shapes
:*

Tidx0*
	keep_dims( 
�
Ltraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/ReshapeReshapeHtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/SumJtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Shape*'
_output_shapes
:���������*
T0*
Tshape0*:
_class0
.,loc:@loss/dense_2_loss/clip_by_value/Minimum
�
Jtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Sum_1SumMtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Select_1\training/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/BroadcastGradientArgs:1*
T0*:
_class0
.,loc:@loss/dense_2_loss/clip_by_value/Minimum*
_output_shapes
:*

Tidx0*
	keep_dims( 
�
Ntraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Reshape_1ReshapeJtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Sum_1Ltraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Shape_1*
_output_shapes
: *
T0*
Tshape0*:
_class0
.,loc:@loss/dense_2_loss/clip_by_value/Minimum
�
8training/Adam/gradients/dense_2/BiasAdd_grad/BiasAddGradBiasAddGradLtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Reshape*
T0*"
_class
loc:@dense_2/BiasAdd*
data_formatNHWC*
_output_shapes
:
�
2training/Adam/gradients/dense_2/MatMul_grad/MatMulMatMulLtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Reshapedense_2/kernel/read*
transpose_b(*
T0*!
_class
loc:@dense_2/MatMul*'
_output_shapes
:���������2*
transpose_a( 
�
4training/Adam/gradients/dense_2/MatMul_grad/MatMul_1MatMuldropout_2/dropout/mulLtraining/Adam/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Reshape*
T0*!
_class
loc:@dense_2/MatMul*
_output_shapes

:2*
transpose_a(*
transpose_b( 
�
8training/Adam/gradients/dropout_2/dropout/mul_grad/ShapeShapedropout_2/dropout/truediv*
T0*
out_type0*(
_class
loc:@dropout_2/dropout/mul*
_output_shapes
:
�
:training/Adam/gradients/dropout_2/dropout/mul_grad/Shape_1Shapedropout_2/dropout/Floor*
T0*
out_type0*(
_class
loc:@dropout_2/dropout/mul*
_output_shapes
:
�
Htraining/Adam/gradients/dropout_2/dropout/mul_grad/BroadcastGradientArgsBroadcastGradientArgs8training/Adam/gradients/dropout_2/dropout/mul_grad/Shape:training/Adam/gradients/dropout_2/dropout/mul_grad/Shape_1*(
_class
loc:@dropout_2/dropout/mul*2
_output_shapes 
:���������:���������*
T0
�
6training/Adam/gradients/dropout_2/dropout/mul_grad/MulMul2training/Adam/gradients/dense_2/MatMul_grad/MatMuldropout_2/dropout/Floor*'
_output_shapes
:���������2*
T0*(
_class
loc:@dropout_2/dropout/mul
�
6training/Adam/gradients/dropout_2/dropout/mul_grad/SumSum6training/Adam/gradients/dropout_2/dropout/mul_grad/MulHtraining/Adam/gradients/dropout_2/dropout/mul_grad/BroadcastGradientArgs*
T0*(
_class
loc:@dropout_2/dropout/mul*
_output_shapes
:*

Tidx0*
	keep_dims( 
�
:training/Adam/gradients/dropout_2/dropout/mul_grad/ReshapeReshape6training/Adam/gradients/dropout_2/dropout/mul_grad/Sum8training/Adam/gradients/dropout_2/dropout/mul_grad/Shape*'
_output_shapes
:���������2*
T0*
Tshape0*(
_class
loc:@dropout_2/dropout/mul
�
8training/Adam/gradients/dropout_2/dropout/mul_grad/Mul_1Muldropout_2/dropout/truediv2training/Adam/gradients/dense_2/MatMul_grad/MatMul*'
_output_shapes
:���������2*
T0*(
_class
loc:@dropout_2/dropout/mul
�
8training/Adam/gradients/dropout_2/dropout/mul_grad/Sum_1Sum8training/Adam/gradients/dropout_2/dropout/mul_grad/Mul_1Jtraining/Adam/gradients/dropout_2/dropout/mul_grad/BroadcastGradientArgs:1*
T0*(
_class
loc:@dropout_2/dropout/mul*
_output_shapes
:*

Tidx0*
	keep_dims( 
�
<training/Adam/gradients/dropout_2/dropout/mul_grad/Reshape_1Reshape8training/Adam/gradients/dropout_2/dropout/mul_grad/Sum_1:training/Adam/gradients/dropout_2/dropout/mul_grad/Shape_1*
Tshape0*(
_class
loc:@dropout_2/dropout/mul*'
_output_shapes
:���������2*
T0
�
<training/Adam/gradients/dropout_2/dropout/truediv_grad/ShapeShapedropout_2/mul*
out_type0*,
_class"
 loc:@dropout_2/dropout/truediv*
_output_shapes
:*
T0
�
>training/Adam/gradients/dropout_2/dropout/truediv_grad/Shape_1Const*
valueB *,
_class"
 loc:@dropout_2/dropout/truediv*
dtype0*
_output_shapes
: 
�
Ltraining/Adam/gradients/dropout_2/dropout/truediv_grad/BroadcastGradientArgsBroadcastGradientArgs<training/Adam/gradients/dropout_2/dropout/truediv_grad/Shape>training/Adam/gradients/dropout_2/dropout/truediv_grad/Shape_1*
T0*,
_class"
 loc:@dropout_2/dropout/truediv*2
_output_shapes 
:���������:���������
�
>training/Adam/gradients/dropout_2/dropout/truediv_grad/RealDivRealDiv:training/Adam/gradients/dropout_2/dropout/mul_grad/Reshapedropout_2/dropout/sub*
T0*,
_class"
 loc:@dropout_2/dropout/truediv*'
_output_shapes
:���������2
�
:training/Adam/gradients/dropout_2/dropout/truediv_grad/SumSum>training/Adam/gradients/dropout_2/dropout/truediv_grad/RealDivLtraining/Adam/gradients/dropout_2/dropout/truediv_grad/BroadcastGradientArgs*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0*,
_class"
 loc:@dropout_2/dropout/truediv
�
>training/Adam/gradients/dropout_2/dropout/truediv_grad/ReshapeReshape:training/Adam/gradients/dropout_2/dropout/truediv_grad/Sum<training/Adam/gradients/dropout_2/dropout/truediv_grad/Shape*
T0*
Tshape0*,
_class"
 loc:@dropout_2/dropout/truediv*'
_output_shapes
:���������2
�
:training/Adam/gradients/dropout_2/dropout/truediv_grad/NegNegdropout_2/mul*,
_class"
 loc:@dropout_2/dropout/truediv*'
_output_shapes
:���������2*
T0
�
@training/Adam/gradients/dropout_2/dropout/truediv_grad/RealDiv_1RealDiv:training/Adam/gradients/dropout_2/dropout/truediv_grad/Negdropout_2/dropout/sub*
T0*,
_class"
 loc:@dropout_2/dropout/truediv*'
_output_shapes
:���������2
�
@training/Adam/gradients/dropout_2/dropout/truediv_grad/RealDiv_2RealDiv@training/Adam/gradients/dropout_2/dropout/truediv_grad/RealDiv_1dropout_2/dropout/sub*
T0*,
_class"
 loc:@dropout_2/dropout/truediv*'
_output_shapes
:���������2
�
:training/Adam/gradients/dropout_2/dropout/truediv_grad/mulMul:training/Adam/gradients/dropout_2/dropout/mul_grad/Reshape@training/Adam/gradients/dropout_2/dropout/truediv_grad/RealDiv_2*
T0*,
_class"
 loc:@dropout_2/dropout/truediv*'
_output_shapes
:���������2
�
<training/Adam/gradients/dropout_2/dropout/truediv_grad/Sum_1Sum:training/Adam/gradients/dropout_2/dropout/truediv_grad/mulNtraining/Adam/gradients/dropout_2/dropout/truediv_grad/BroadcastGradientArgs:1*,
_class"
 loc:@dropout_2/dropout/truediv*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0
�
@training/Adam/gradients/dropout_2/dropout/truediv_grad/Reshape_1Reshape<training/Adam/gradients/dropout_2/dropout/truediv_grad/Sum_1>training/Adam/gradients/dropout_2/dropout/truediv_grad/Shape_1*
T0*
Tshape0*,
_class"
 loc:@dropout_2/dropout/truediv*
_output_shapes
: 
�
0training/Adam/gradients/dropout_2/mul_grad/ShapeShapeactivation_1/Relu*
T0*
out_type0* 
_class
loc:@dropout_2/mul*
_output_shapes
:
�
2training/Adam/gradients/dropout_2/mul_grad/Shape_1Const*
valueB * 
_class
loc:@dropout_2/mul*
dtype0*
_output_shapes
: 
�
@training/Adam/gradients/dropout_2/mul_grad/BroadcastGradientArgsBroadcastGradientArgs0training/Adam/gradients/dropout_2/mul_grad/Shape2training/Adam/gradients/dropout_2/mul_grad/Shape_1*
T0* 
_class
loc:@dropout_2/mul*2
_output_shapes 
:���������:���������
�
.training/Adam/gradients/dropout_2/mul_grad/MulMul>training/Adam/gradients/dropout_2/dropout/truediv_grad/Reshapedropout_2/mul/y*
T0* 
_class
loc:@dropout_2/mul*'
_output_shapes
:���������2
�
.training/Adam/gradients/dropout_2/mul_grad/SumSum.training/Adam/gradients/dropout_2/mul_grad/Mul@training/Adam/gradients/dropout_2/mul_grad/BroadcastGradientArgs* 
_class
loc:@dropout_2/mul*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0
�
2training/Adam/gradients/dropout_2/mul_grad/ReshapeReshape.training/Adam/gradients/dropout_2/mul_grad/Sum0training/Adam/gradients/dropout_2/mul_grad/Shape*
T0*
Tshape0* 
_class
loc:@dropout_2/mul*'
_output_shapes
:���������2
�
0training/Adam/gradients/dropout_2/mul_grad/Mul_1Mulactivation_1/Relu>training/Adam/gradients/dropout_2/dropout/truediv_grad/Reshape*
T0* 
_class
loc:@dropout_2/mul*'
_output_shapes
:���������2
�
0training/Adam/gradients/dropout_2/mul_grad/Sum_1Sum0training/Adam/gradients/dropout_2/mul_grad/Mul_1Btraining/Adam/gradients/dropout_2/mul_grad/BroadcastGradientArgs:1*
T0* 
_class
loc:@dropout_2/mul*
_output_shapes
:*

Tidx0*
	keep_dims( 
�
4training/Adam/gradients/dropout_2/mul_grad/Reshape_1Reshape0training/Adam/gradients/dropout_2/mul_grad/Sum_12training/Adam/gradients/dropout_2/mul_grad/Shape_1*
Tshape0* 
_class
loc:@dropout_2/mul*
_output_shapes
: *
T0
�
7training/Adam/gradients/activation_1/Relu_grad/ReluGradReluGrad2training/Adam/gradients/dropout_2/mul_grad/Reshapeactivation_1/Relu*'
_output_shapes
:���������2*
T0*$
_class
loc:@activation_1/Relu
�
8training/Adam/gradients/dense_1/BiasAdd_grad/BiasAddGradBiasAddGrad7training/Adam/gradients/activation_1/Relu_grad/ReluGrad*
T0*"
_class
loc:@dense_1/BiasAdd*
data_formatNHWC*
_output_shapes
:2
�
2training/Adam/gradients/dense_1/MatMul_grad/MatMulMatMul7training/Adam/gradients/activation_1/Relu_grad/ReluGraddense_1/kernel/read*
T0*!
_class
loc:@dense_1/MatMul*'
_output_shapes
:���������d*
transpose_a( *
transpose_b(
�
4training/Adam/gradients/dense_1/MatMul_grad/MatMul_1MatMuldropout_1/dropout/mul7training/Adam/gradients/activation_1/Relu_grad/ReluGrad*
_output_shapes

:d2*
transpose_a(*
transpose_b( *
T0*!
_class
loc:@dense_1/MatMul
�
8training/Adam/gradients/dropout_1/dropout/mul_grad/ShapeShapedropout_1/dropout/truediv*
T0*
out_type0*(
_class
loc:@dropout_1/dropout/mul*
_output_shapes
:
�
:training/Adam/gradients/dropout_1/dropout/mul_grad/Shape_1Shapedropout_1/dropout/Floor*
T0*
out_type0*(
_class
loc:@dropout_1/dropout/mul*
_output_shapes
:
�
Htraining/Adam/gradients/dropout_1/dropout/mul_grad/BroadcastGradientArgsBroadcastGradientArgs8training/Adam/gradients/dropout_1/dropout/mul_grad/Shape:training/Adam/gradients/dropout_1/dropout/mul_grad/Shape_1*
T0*(
_class
loc:@dropout_1/dropout/mul*2
_output_shapes 
:���������:���������
�
6training/Adam/gradients/dropout_1/dropout/mul_grad/MulMul2training/Adam/gradients/dense_1/MatMul_grad/MatMuldropout_1/dropout/Floor*
T0*(
_class
loc:@dropout_1/dropout/mul*'
_output_shapes
:���������d
�
6training/Adam/gradients/dropout_1/dropout/mul_grad/SumSum6training/Adam/gradients/dropout_1/dropout/mul_grad/MulHtraining/Adam/gradients/dropout_1/dropout/mul_grad/BroadcastGradientArgs*
T0*(
_class
loc:@dropout_1/dropout/mul*
_output_shapes
:*

Tidx0*
	keep_dims( 
�
:training/Adam/gradients/dropout_1/dropout/mul_grad/ReshapeReshape6training/Adam/gradients/dropout_1/dropout/mul_grad/Sum8training/Adam/gradients/dropout_1/dropout/mul_grad/Shape*
Tshape0*(
_class
loc:@dropout_1/dropout/mul*'
_output_shapes
:���������d*
T0
�
8training/Adam/gradients/dropout_1/dropout/mul_grad/Mul_1Muldropout_1/dropout/truediv2training/Adam/gradients/dense_1/MatMul_grad/MatMul*
T0*(
_class
loc:@dropout_1/dropout/mul*'
_output_shapes
:���������d
�
8training/Adam/gradients/dropout_1/dropout/mul_grad/Sum_1Sum8training/Adam/gradients/dropout_1/dropout/mul_grad/Mul_1Jtraining/Adam/gradients/dropout_1/dropout/mul_grad/BroadcastGradientArgs:1*
T0*(
_class
loc:@dropout_1/dropout/mul*
_output_shapes
:*

Tidx0*
	keep_dims( 
�
<training/Adam/gradients/dropout_1/dropout/mul_grad/Reshape_1Reshape8training/Adam/gradients/dropout_1/dropout/mul_grad/Sum_1:training/Adam/gradients/dropout_1/dropout/mul_grad/Shape_1*
T0*
Tshape0*(
_class
loc:@dropout_1/dropout/mul*'
_output_shapes
:���������d
�
<training/Adam/gradients/dropout_1/dropout/truediv_grad/ShapeShapedropout_1/mul*
T0*
out_type0*,
_class"
 loc:@dropout_1/dropout/truediv*
_output_shapes
:
�
>training/Adam/gradients/dropout_1/dropout/truediv_grad/Shape_1Const*
_output_shapes
: *
valueB *,
_class"
 loc:@dropout_1/dropout/truediv*
dtype0
�
Ltraining/Adam/gradients/dropout_1/dropout/truediv_grad/BroadcastGradientArgsBroadcastGradientArgs<training/Adam/gradients/dropout_1/dropout/truediv_grad/Shape>training/Adam/gradients/dropout_1/dropout/truediv_grad/Shape_1*
T0*,
_class"
 loc:@dropout_1/dropout/truediv*2
_output_shapes 
:���������:���������
�
>training/Adam/gradients/dropout_1/dropout/truediv_grad/RealDivRealDiv:training/Adam/gradients/dropout_1/dropout/mul_grad/Reshapedropout_1/dropout/sub*
T0*,
_class"
 loc:@dropout_1/dropout/truediv*'
_output_shapes
:���������d
�
:training/Adam/gradients/dropout_1/dropout/truediv_grad/SumSum>training/Adam/gradients/dropout_1/dropout/truediv_grad/RealDivLtraining/Adam/gradients/dropout_1/dropout/truediv_grad/BroadcastGradientArgs*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0*,
_class"
 loc:@dropout_1/dropout/truediv
�
>training/Adam/gradients/dropout_1/dropout/truediv_grad/ReshapeReshape:training/Adam/gradients/dropout_1/dropout/truediv_grad/Sum<training/Adam/gradients/dropout_1/dropout/truediv_grad/Shape*
T0*
Tshape0*,
_class"
 loc:@dropout_1/dropout/truediv*'
_output_shapes
:���������d
�
:training/Adam/gradients/dropout_1/dropout/truediv_grad/NegNegdropout_1/mul*
T0*,
_class"
 loc:@dropout_1/dropout/truediv*'
_output_shapes
:���������d
�
@training/Adam/gradients/dropout_1/dropout/truediv_grad/RealDiv_1RealDiv:training/Adam/gradients/dropout_1/dropout/truediv_grad/Negdropout_1/dropout/sub*
T0*,
_class"
 loc:@dropout_1/dropout/truediv*'
_output_shapes
:���������d
�
@training/Adam/gradients/dropout_1/dropout/truediv_grad/RealDiv_2RealDiv@training/Adam/gradients/dropout_1/dropout/truediv_grad/RealDiv_1dropout_1/dropout/sub*
T0*,
_class"
 loc:@dropout_1/dropout/truediv*'
_output_shapes
:���������d
�
:training/Adam/gradients/dropout_1/dropout/truediv_grad/mulMul:training/Adam/gradients/dropout_1/dropout/mul_grad/Reshape@training/Adam/gradients/dropout_1/dropout/truediv_grad/RealDiv_2*
T0*,
_class"
 loc:@dropout_1/dropout/truediv*'
_output_shapes
:���������d
�
<training/Adam/gradients/dropout_1/dropout/truediv_grad/Sum_1Sum:training/Adam/gradients/dropout_1/dropout/truediv_grad/mulNtraining/Adam/gradients/dropout_1/dropout/truediv_grad/BroadcastGradientArgs:1*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0*,
_class"
 loc:@dropout_1/dropout/truediv
�
@training/Adam/gradients/dropout_1/dropout/truediv_grad/Reshape_1Reshape<training/Adam/gradients/dropout_1/dropout/truediv_grad/Sum_1>training/Adam/gradients/dropout_1/dropout/truediv_grad/Shape_1*
Tshape0*,
_class"
 loc:@dropout_1/dropout/truediv*
_output_shapes
: *
T0
�
0training/Adam/gradients/dropout_1/mul_grad/ShapeShapeconcatenate_1/concat*
T0*
out_type0* 
_class
loc:@dropout_1/mul*
_output_shapes
:
�
2training/Adam/gradients/dropout_1/mul_grad/Shape_1Const*
valueB * 
_class
loc:@dropout_1/mul*
dtype0*
_output_shapes
: 
�
@training/Adam/gradients/dropout_1/mul_grad/BroadcastGradientArgsBroadcastGradientArgs0training/Adam/gradients/dropout_1/mul_grad/Shape2training/Adam/gradients/dropout_1/mul_grad/Shape_1*
T0* 
_class
loc:@dropout_1/mul*2
_output_shapes 
:���������:���������
�
.training/Adam/gradients/dropout_1/mul_grad/MulMul>training/Adam/gradients/dropout_1/dropout/truediv_grad/Reshapedropout_1/mul/y*
T0* 
_class
loc:@dropout_1/mul*'
_output_shapes
:���������d
�
.training/Adam/gradients/dropout_1/mul_grad/SumSum.training/Adam/gradients/dropout_1/mul_grad/Mul@training/Adam/gradients/dropout_1/mul_grad/BroadcastGradientArgs*
T0* 
_class
loc:@dropout_1/mul*
_output_shapes
:*

Tidx0*
	keep_dims( 
�
2training/Adam/gradients/dropout_1/mul_grad/ReshapeReshape.training/Adam/gradients/dropout_1/mul_grad/Sum0training/Adam/gradients/dropout_1/mul_grad/Shape*
T0*
Tshape0* 
_class
loc:@dropout_1/mul*'
_output_shapes
:���������d
�
0training/Adam/gradients/dropout_1/mul_grad/Mul_1Mulconcatenate_1/concat>training/Adam/gradients/dropout_1/dropout/truediv_grad/Reshape*'
_output_shapes
:���������d*
T0* 
_class
loc:@dropout_1/mul
�
0training/Adam/gradients/dropout_1/mul_grad/Sum_1Sum0training/Adam/gradients/dropout_1/mul_grad/Mul_1Btraining/Adam/gradients/dropout_1/mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0* 
_class
loc:@dropout_1/mul*
_output_shapes
:
�
4training/Adam/gradients/dropout_1/mul_grad/Reshape_1Reshape0training/Adam/gradients/dropout_1/mul_grad/Sum_12training/Adam/gradients/dropout_1/mul_grad/Shape_1*
_output_shapes
: *
T0*
Tshape0* 
_class
loc:@dropout_1/mul
�
6training/Adam/gradients/concatenate_1/concat_grad/RankConst*
value	B :*'
_class
loc:@concatenate_1/concat*
dtype0*
_output_shapes
: 
�
5training/Adam/gradients/concatenate_1/concat_grad/modFloorModconcatenate_1/concat/axis6training/Adam/gradients/concatenate_1/concat_grad/Rank*
_output_shapes
: *
T0*'
_class
loc:@concatenate_1/concat
�
7training/Adam/gradients/concatenate_1/concat_grad/ShapeShapereshape_1/Reshape*
out_type0*'
_class
loc:@concatenate_1/concat*
_output_shapes
:*
T0
�
8training/Adam/gradients/concatenate_1/concat_grad/ShapeNShapeNreshape_1/Reshapereshape_2/Reshape* 
_output_shapes
::*
T0*
out_type0*'
_class
loc:@concatenate_1/concat*
N
�
>training/Adam/gradients/concatenate_1/concat_grad/ConcatOffsetConcatOffset5training/Adam/gradients/concatenate_1/concat_grad/mod8training/Adam/gradients/concatenate_1/concat_grad/ShapeN:training/Adam/gradients/concatenate_1/concat_grad/ShapeN:1*'
_class
loc:@concatenate_1/concat*
N* 
_output_shapes
::
�
7training/Adam/gradients/concatenate_1/concat_grad/SliceSlice2training/Adam/gradients/dropout_1/mul_grad/Reshape>training/Adam/gradients/concatenate_1/concat_grad/ConcatOffset8training/Adam/gradients/concatenate_1/concat_grad/ShapeN*'
_output_shapes
:���������2*
T0*
Index0*'
_class
loc:@concatenate_1/concat
�
9training/Adam/gradients/concatenate_1/concat_grad/Slice_1Slice2training/Adam/gradients/dropout_1/mul_grad/Reshape@training/Adam/gradients/concatenate_1/concat_grad/ConcatOffset:1:training/Adam/gradients/concatenate_1/concat_grad/ShapeN:1*
T0*
Index0*'
_class
loc:@concatenate_1/concat*'
_output_shapes
:���������2
�
4training/Adam/gradients/reshape_1/Reshape_grad/ShapeShape%embedding_1/embedding_lookup/Identity*
T0*
out_type0*$
_class
loc:@reshape_1/Reshape*
_output_shapes
:
�
6training/Adam/gradients/reshape_1/Reshape_grad/ReshapeReshape7training/Adam/gradients/concatenate_1/concat_grad/Slice4training/Adam/gradients/reshape_1/Reshape_grad/Shape*
T0*
Tshape0*$
_class
loc:@reshape_1/Reshape*+
_output_shapes
:���������2
�
4training/Adam/gradients/reshape_2/Reshape_grad/ShapeShape%embedding_2/embedding_lookup/Identity*
_output_shapes
:*
T0*
out_type0*$
_class
loc:@reshape_2/Reshape
�
6training/Adam/gradients/reshape_2/Reshape_grad/ReshapeReshape9training/Adam/gradients/concatenate_1/concat_grad/Slice_14training/Adam/gradients/reshape_2/Reshape_grad/Shape*
T0*
Tshape0*$
_class
loc:@reshape_2/Reshape*+
_output_shapes
:���������2
�
?training/Adam/gradients/embedding_1/embedding_lookup_grad/ShapeConst*%
valueB	"�o      2       *)
_class
loc:@embedding_1/embeddings*
dtype0	*
_output_shapes
:
�
Atraining/Adam/gradients/embedding_1/embedding_lookup_grad/ToInt32Cast?training/Adam/gradients/embedding_1/embedding_lookup_grad/Shape*

SrcT0	*)
_class
loc:@embedding_1/embeddings*
Truncate( *
_output_shapes
:*

DstT0
�
>training/Adam/gradients/embedding_1/embedding_lookup_grad/SizeSizeembedding_1/Cast*
T0*
out_type0*)
_class
loc:@embedding_1/embeddings*
_output_shapes
: 
�
Htraining/Adam/gradients/embedding_1/embedding_lookup_grad/ExpandDims/dimConst*
value	B : *)
_class
loc:@embedding_1/embeddings*
dtype0*
_output_shapes
: 
�
Dtraining/Adam/gradients/embedding_1/embedding_lookup_grad/ExpandDims
ExpandDims>training/Adam/gradients/embedding_1/embedding_lookup_grad/SizeHtraining/Adam/gradients/embedding_1/embedding_lookup_grad/ExpandDims/dim*
_output_shapes
:*

Tdim0*
T0*)
_class
loc:@embedding_1/embeddings
�
Mtraining/Adam/gradients/embedding_1/embedding_lookup_grad/strided_slice/stackConst*
valueB:*)
_class
loc:@embedding_1/embeddings*
dtype0*
_output_shapes
:
�
Otraining/Adam/gradients/embedding_1/embedding_lookup_grad/strided_slice/stack_1Const*
valueB: *)
_class
loc:@embedding_1/embeddings*
dtype0*
_output_shapes
:
�
Otraining/Adam/gradients/embedding_1/embedding_lookup_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:*)
_class
loc:@embedding_1/embeddings
�
Gtraining/Adam/gradients/embedding_1/embedding_lookup_grad/strided_sliceStridedSliceAtraining/Adam/gradients/embedding_1/embedding_lookup_grad/ToInt32Mtraining/Adam/gradients/embedding_1/embedding_lookup_grad/strided_slice/stackOtraining/Adam/gradients/embedding_1/embedding_lookup_grad/strided_slice/stack_1Otraining/Adam/gradients/embedding_1/embedding_lookup_grad/strided_slice/stack_2*
shrink_axis_mask *
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask*
_output_shapes
:*
T0*
Index0*)
_class
loc:@embedding_1/embeddings
�
Etraining/Adam/gradients/embedding_1/embedding_lookup_grad/concat/axisConst*
value	B : *)
_class
loc:@embedding_1/embeddings*
dtype0*
_output_shapes
: 
�
@training/Adam/gradients/embedding_1/embedding_lookup_grad/concatConcatV2Dtraining/Adam/gradients/embedding_1/embedding_lookup_grad/ExpandDimsGtraining/Adam/gradients/embedding_1/embedding_lookup_grad/strided_sliceEtraining/Adam/gradients/embedding_1/embedding_lookup_grad/concat/axis*
T0*)
_class
loc:@embedding_1/embeddings*
N*
_output_shapes
:*

Tidx0
�
Atraining/Adam/gradients/embedding_1/embedding_lookup_grad/ReshapeReshape6training/Adam/gradients/reshape_1/Reshape_grad/Reshape@training/Adam/gradients/embedding_1/embedding_lookup_grad/concat*
T0*
Tshape0*)
_class
loc:@embedding_1/embeddings*'
_output_shapes
:���������2
�
Ctraining/Adam/gradients/embedding_1/embedding_lookup_grad/Reshape_1Reshapeembedding_1/CastDtraining/Adam/gradients/embedding_1/embedding_lookup_grad/ExpandDims*
T0*
Tshape0*)
_class
loc:@embedding_1/embeddings*#
_output_shapes
:���������
�
?training/Adam/gradients/embedding_2/embedding_lookup_grad/ShapeConst*%
valueB	",      2       *)
_class
loc:@embedding_2/embeddings*
dtype0	*
_output_shapes
:
�
Atraining/Adam/gradients/embedding_2/embedding_lookup_grad/ToInt32Cast?training/Adam/gradients/embedding_2/embedding_lookup_grad/Shape*)
_class
loc:@embedding_2/embeddings*
Truncate( *
_output_shapes
:*

DstT0*

SrcT0	
�
>training/Adam/gradients/embedding_2/embedding_lookup_grad/SizeSizeembedding_2/Cast*
T0*
out_type0*)
_class
loc:@embedding_2/embeddings*
_output_shapes
: 
�
Htraining/Adam/gradients/embedding_2/embedding_lookup_grad/ExpandDims/dimConst*
value	B : *)
_class
loc:@embedding_2/embeddings*
dtype0*
_output_shapes
: 
�
Dtraining/Adam/gradients/embedding_2/embedding_lookup_grad/ExpandDims
ExpandDims>training/Adam/gradients/embedding_2/embedding_lookup_grad/SizeHtraining/Adam/gradients/embedding_2/embedding_lookup_grad/ExpandDims/dim*

Tdim0*
T0*)
_class
loc:@embedding_2/embeddings*
_output_shapes
:
�
Mtraining/Adam/gradients/embedding_2/embedding_lookup_grad/strided_slice/stackConst*
valueB:*)
_class
loc:@embedding_2/embeddings*
dtype0*
_output_shapes
:
�
Otraining/Adam/gradients/embedding_2/embedding_lookup_grad/strided_slice/stack_1Const*
valueB: *)
_class
loc:@embedding_2/embeddings*
dtype0*
_output_shapes
:
�
Otraining/Adam/gradients/embedding_2/embedding_lookup_grad/strided_slice/stack_2Const*
valueB:*)
_class
loc:@embedding_2/embeddings*
dtype0*
_output_shapes
:
�
Gtraining/Adam/gradients/embedding_2/embedding_lookup_grad/strided_sliceStridedSliceAtraining/Adam/gradients/embedding_2/embedding_lookup_grad/ToInt32Mtraining/Adam/gradients/embedding_2/embedding_lookup_grad/strided_slice/stackOtraining/Adam/gradients/embedding_2/embedding_lookup_grad/strided_slice/stack_1Otraining/Adam/gradients/embedding_2/embedding_lookup_grad/strided_slice/stack_2*
new_axis_mask *
end_mask*
_output_shapes
:*
T0*
Index0*)
_class
loc:@embedding_2/embeddings*
shrink_axis_mask *

begin_mask *
ellipsis_mask 
�
Etraining/Adam/gradients/embedding_2/embedding_lookup_grad/concat/axisConst*
value	B : *)
_class
loc:@embedding_2/embeddings*
dtype0*
_output_shapes
: 
�
@training/Adam/gradients/embedding_2/embedding_lookup_grad/concatConcatV2Dtraining/Adam/gradients/embedding_2/embedding_lookup_grad/ExpandDimsGtraining/Adam/gradients/embedding_2/embedding_lookup_grad/strided_sliceEtraining/Adam/gradients/embedding_2/embedding_lookup_grad/concat/axis*
T0*)
_class
loc:@embedding_2/embeddings*
N*
_output_shapes
:*

Tidx0
�
Atraining/Adam/gradients/embedding_2/embedding_lookup_grad/ReshapeReshape6training/Adam/gradients/reshape_2/Reshape_grad/Reshape@training/Adam/gradients/embedding_2/embedding_lookup_grad/concat*
Tshape0*)
_class
loc:@embedding_2/embeddings*'
_output_shapes
:���������2*
T0
�
Ctraining/Adam/gradients/embedding_2/embedding_lookup_grad/Reshape_1Reshapeembedding_2/CastDtraining/Adam/gradients/embedding_2/embedding_lookup_grad/ExpandDims*
T0*
Tshape0*)
_class
loc:@embedding_2/embeddings*#
_output_shapes
:���������
_
training/Adam/AssignAdd/valueConst*
value	B	 R*
dtype0	*
_output_shapes
: 
�
training/Adam/AssignAdd	AssignAddAdam/iterationstraining/Adam/AssignAdd/value*
T0	*"
_class
loc:@Adam/iterations*
_output_shapes
: *
use_locking( 
p
training/Adam/CastCastAdam/iterations/read*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
X
training/Adam/add/yConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
b
training/Adam/addAddtraining/Adam/Casttraining/Adam/add/y*
T0*
_output_shapes
: 
^
training/Adam/PowPowAdam/beta_2/readtraining/Adam/add*
T0*
_output_shapes
: 
X
training/Adam/sub/xConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
a
training/Adam/subSubtraining/Adam/sub/xtraining/Adam/Pow*
_output_shapes
: *
T0
X
training/Adam/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Z
training/Adam/Const_1Const*
valueB
 *  �*
dtype0*
_output_shapes
: 
y
#training/Adam/clip_by_value/MinimumMinimumtraining/Adam/subtraining/Adam/Const_1*
T0*
_output_shapes
: 
�
training/Adam/clip_by_valueMaximum#training/Adam/clip_by_value/Minimumtraining/Adam/Const*
T0*
_output_shapes
: 
X
training/Adam/SqrtSqrttraining/Adam/clip_by_value*
_output_shapes
: *
T0
`
training/Adam/Pow_1PowAdam/beta_1/readtraining/Adam/add*
_output_shapes
: *
T0
Z
training/Adam/sub_1/xConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
g
training/Adam/sub_1Subtraining/Adam/sub_1/xtraining/Adam/Pow_1*
_output_shapes
: *
T0
j
training/Adam/truedivRealDivtraining/Adam/Sqrttraining/Adam/sub_1*
T0*
_output_shapes
: 
^
training/Adam/mulMulAdam/lr/readtraining/Adam/truediv*
T0*
_output_shapes
: 
t
#training/Adam/zeros/shape_as_tensorConst*
_output_shapes
:*
valueB"�o  2   *
dtype0
^
training/Adam/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
training/Adam/zerosFill#training/Adam/zeros/shape_as_tensortraining/Adam/zeros/Const* 
_output_shapes
:
��2*
T0*

index_type0
�
training/Adam/Variable
VariableV2*
dtype0* 
_output_shapes
:
��2*
	container *
shape:
��2*
shared_name 
�
training/Adam/Variable/AssignAssigntraining/Adam/Variabletraining/Adam/zeros*
T0*)
_class
loc:@training/Adam/Variable*
validate_shape(* 
_output_shapes
:
��2*
use_locking(
�
training/Adam/Variable/readIdentitytraining/Adam/Variable* 
_output_shapes
:
��2*
T0*)
_class
loc:@training/Adam/Variable
v
%training/Adam/zeros_1/shape_as_tensorConst*
valueB",  2   *
dtype0*
_output_shapes
:
`
training/Adam/zeros_1/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
training/Adam/zeros_1Fill%training/Adam/zeros_1/shape_as_tensortraining/Adam/zeros_1/Const*
T0*

index_type0*
_output_shapes
:	�2
�
training/Adam/Variable_1
VariableV2*
shared_name *
dtype0*
_output_shapes
:	�2*
	container *
shape:	�2
�
training/Adam/Variable_1/AssignAssigntraining/Adam/Variable_1training/Adam/zeros_1*
validate_shape(*
_output_shapes
:	�2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_1
�
training/Adam/Variable_1/readIdentitytraining/Adam/Variable_1*
T0*+
_class!
loc:@training/Adam/Variable_1*
_output_shapes
:	�2
v
%training/Adam/zeros_2/shape_as_tensorConst*
valueB"d   2   *
dtype0*
_output_shapes
:
`
training/Adam/zeros_2/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
training/Adam/zeros_2Fill%training/Adam/zeros_2/shape_as_tensortraining/Adam/zeros_2/Const*
T0*

index_type0*
_output_shapes

:d2
�
training/Adam/Variable_2
VariableV2*
shared_name *
dtype0*
_output_shapes

:d2*
	container *
shape
:d2
�
training/Adam/Variable_2/AssignAssigntraining/Adam/Variable_2training/Adam/zeros_2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_2*
validate_shape(*
_output_shapes

:d2
�
training/Adam/Variable_2/readIdentitytraining/Adam/Variable_2*
T0*+
_class!
loc:@training/Adam/Variable_2*
_output_shapes

:d2
b
training/Adam/zeros_3Const*
_output_shapes
:2*
valueB2*    *
dtype0
�
training/Adam/Variable_3
VariableV2*
shared_name *
dtype0*
_output_shapes
:2*
	container *
shape:2
�
training/Adam/Variable_3/AssignAssigntraining/Adam/Variable_3training/Adam/zeros_3*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_3*
validate_shape(*
_output_shapes
:2
�
training/Adam/Variable_3/readIdentitytraining/Adam/Variable_3*
T0*+
_class!
loc:@training/Adam/Variable_3*
_output_shapes
:2
j
training/Adam/zeros_4Const*
valueB2*    *
dtype0*
_output_shapes

:2
�
training/Adam/Variable_4
VariableV2*
dtype0*
_output_shapes

:2*
	container *
shape
:2*
shared_name 
�
training/Adam/Variable_4/AssignAssigntraining/Adam/Variable_4training/Adam/zeros_4*
validate_shape(*
_output_shapes

:2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_4
�
training/Adam/Variable_4/readIdentitytraining/Adam/Variable_4*
T0*+
_class!
loc:@training/Adam/Variable_4*
_output_shapes

:2
b
training/Adam/zeros_5Const*
_output_shapes
:*
valueB*    *
dtype0
�
training/Adam/Variable_5
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
�
training/Adam/Variable_5/AssignAssigntraining/Adam/Variable_5training/Adam/zeros_5*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_5*
validate_shape(*
_output_shapes
:
�
training/Adam/Variable_5/readIdentitytraining/Adam/Variable_5*
T0*+
_class!
loc:@training/Adam/Variable_5*
_output_shapes
:
v
%training/Adam/zeros_6/shape_as_tensorConst*
valueB"�o  2   *
dtype0*
_output_shapes
:
`
training/Adam/zeros_6/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
training/Adam/zeros_6Fill%training/Adam/zeros_6/shape_as_tensortraining/Adam/zeros_6/Const*
T0*

index_type0* 
_output_shapes
:
��2
�
training/Adam/Variable_6
VariableV2*
dtype0* 
_output_shapes
:
��2*
	container *
shape:
��2*
shared_name 
�
training/Adam/Variable_6/AssignAssigntraining/Adam/Variable_6training/Adam/zeros_6*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_6*
validate_shape(* 
_output_shapes
:
��2
�
training/Adam/Variable_6/readIdentitytraining/Adam/Variable_6* 
_output_shapes
:
��2*
T0*+
_class!
loc:@training/Adam/Variable_6
v
%training/Adam/zeros_7/shape_as_tensorConst*
_output_shapes
:*
valueB",  2   *
dtype0
`
training/Adam/zeros_7/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
training/Adam/zeros_7Fill%training/Adam/zeros_7/shape_as_tensortraining/Adam/zeros_7/Const*
T0*

index_type0*
_output_shapes
:	�2
�
training/Adam/Variable_7
VariableV2*
shape:	�2*
shared_name *
dtype0*
_output_shapes
:	�2*
	container 
�
training/Adam/Variable_7/AssignAssigntraining/Adam/Variable_7training/Adam/zeros_7*
validate_shape(*
_output_shapes
:	�2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_7
�
training/Adam/Variable_7/readIdentitytraining/Adam/Variable_7*+
_class!
loc:@training/Adam/Variable_7*
_output_shapes
:	�2*
T0
v
%training/Adam/zeros_8/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB"d   2   
`
training/Adam/zeros_8/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
training/Adam/zeros_8Fill%training/Adam/zeros_8/shape_as_tensortraining/Adam/zeros_8/Const*
_output_shapes

:d2*
T0*

index_type0
�
training/Adam/Variable_8
VariableV2*
shape
:d2*
shared_name *
dtype0*
_output_shapes

:d2*
	container 
�
training/Adam/Variable_8/AssignAssigntraining/Adam/Variable_8training/Adam/zeros_8*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_8*
validate_shape(*
_output_shapes

:d2
�
training/Adam/Variable_8/readIdentitytraining/Adam/Variable_8*
T0*+
_class!
loc:@training/Adam/Variable_8*
_output_shapes

:d2
b
training/Adam/zeros_9Const*
valueB2*    *
dtype0*
_output_shapes
:2
�
training/Adam/Variable_9
VariableV2*
shared_name *
dtype0*
_output_shapes
:2*
	container *
shape:2
�
training/Adam/Variable_9/AssignAssigntraining/Adam/Variable_9training/Adam/zeros_9*
validate_shape(*
_output_shapes
:2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_9
�
training/Adam/Variable_9/readIdentitytraining/Adam/Variable_9*
T0*+
_class!
loc:@training/Adam/Variable_9*
_output_shapes
:2
k
training/Adam/zeros_10Const*
valueB2*    *
dtype0*
_output_shapes

:2
�
training/Adam/Variable_10
VariableV2*
shared_name *
dtype0*
_output_shapes

:2*
	container *
shape
:2
�
 training/Adam/Variable_10/AssignAssigntraining/Adam/Variable_10training/Adam/zeros_10*
validate_shape(*
_output_shapes

:2*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_10
�
training/Adam/Variable_10/readIdentitytraining/Adam/Variable_10*
T0*,
_class"
 loc:@training/Adam/Variable_10*
_output_shapes

:2
c
training/Adam/zeros_11Const*
valueB*    *
dtype0*
_output_shapes
:
�
training/Adam/Variable_11
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
�
 training/Adam/Variable_11/AssignAssigntraining/Adam/Variable_11training/Adam/zeros_11*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_11
�
training/Adam/Variable_11/readIdentitytraining/Adam/Variable_11*,
_class"
 loc:@training/Adam/Variable_11*
_output_shapes
:*
T0
p
&training/Adam/zeros_12/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
a
training/Adam/zeros_12/ConstConst*
_output_shapes
: *
valueB
 *    *
dtype0
�
training/Adam/zeros_12Fill&training/Adam/zeros_12/shape_as_tensortraining/Adam/zeros_12/Const*
_output_shapes
:*
T0*

index_type0
�
training/Adam/Variable_12
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
�
 training/Adam/Variable_12/AssignAssigntraining/Adam/Variable_12training/Adam/zeros_12*
T0*,
_class"
 loc:@training/Adam/Variable_12*
validate_shape(*
_output_shapes
:*
use_locking(
�
training/Adam/Variable_12/readIdentitytraining/Adam/Variable_12*
T0*,
_class"
 loc:@training/Adam/Variable_12*
_output_shapes
:
p
&training/Adam/zeros_13/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB:
a
training/Adam/zeros_13/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
training/Adam/zeros_13Fill&training/Adam/zeros_13/shape_as_tensortraining/Adam/zeros_13/Const*
T0*

index_type0*
_output_shapes
:
�
training/Adam/Variable_13
VariableV2*
shared_name *
dtype0*
_output_shapes
:*
	container *
shape:
�
 training/Adam/Variable_13/AssignAssigntraining/Adam/Variable_13training/Adam/zeros_13*
_output_shapes
:*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_13*
validate_shape(
�
training/Adam/Variable_13/readIdentitytraining/Adam/Variable_13*
T0*,
_class"
 loc:@training/Adam/Variable_13*
_output_shapes
:
p
&training/Adam/zeros_14/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
a
training/Adam/zeros_14/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
training/Adam/zeros_14Fill&training/Adam/zeros_14/shape_as_tensortraining/Adam/zeros_14/Const*
T0*

index_type0*
_output_shapes
:
�
training/Adam/Variable_14
VariableV2*
shared_name *
dtype0*
_output_shapes
:*
	container *
shape:
�
 training/Adam/Variable_14/AssignAssigntraining/Adam/Variable_14training/Adam/zeros_14*
_output_shapes
:*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_14*
validate_shape(
�
training/Adam/Variable_14/readIdentitytraining/Adam/Variable_14*
T0*,
_class"
 loc:@training/Adam/Variable_14*
_output_shapes
:
p
&training/Adam/zeros_15/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
a
training/Adam/zeros_15/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
training/Adam/zeros_15Fill&training/Adam/zeros_15/shape_as_tensortraining/Adam/zeros_15/Const*
T0*

index_type0*
_output_shapes
:
�
training/Adam/Variable_15
VariableV2*
shared_name *
dtype0*
_output_shapes
:*
	container *
shape:
�
 training/Adam/Variable_15/AssignAssigntraining/Adam/Variable_15training/Adam/zeros_15*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_15
�
training/Adam/Variable_15/readIdentitytraining/Adam/Variable_15*,
_class"
 loc:@training/Adam/Variable_15*
_output_shapes
:*
T0
p
&training/Adam/zeros_16/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
a
training/Adam/zeros_16/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
training/Adam/zeros_16Fill&training/Adam/zeros_16/shape_as_tensortraining/Adam/zeros_16/Const*
_output_shapes
:*
T0*

index_type0
�
training/Adam/Variable_16
VariableV2*
_output_shapes
:*
	container *
shape:*
shared_name *
dtype0
�
 training/Adam/Variable_16/AssignAssigntraining/Adam/Variable_16training/Adam/zeros_16*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_16*
validate_shape(*
_output_shapes
:
�
training/Adam/Variable_16/readIdentitytraining/Adam/Variable_16*
T0*,
_class"
 loc:@training/Adam/Variable_16*
_output_shapes
:
p
&training/Adam/zeros_17/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
a
training/Adam/zeros_17/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
training/Adam/zeros_17Fill&training/Adam/zeros_17/shape_as_tensortraining/Adam/zeros_17/Const*
T0*

index_type0*
_output_shapes
:
�
training/Adam/Variable_17
VariableV2*
shape:*
shared_name *
dtype0*
_output_shapes
:*
	container 
�
 training/Adam/Variable_17/AssignAssigntraining/Adam/Variable_17training/Adam/zeros_17*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_17*
validate_shape(*
_output_shapes
:
�
training/Adam/Variable_17/readIdentitytraining/Adam/Variable_17*
_output_shapes
:*
T0*,
_class"
 loc:@training/Adam/Variable_17
t
training/Adam/mul_1MulAdam/beta_1/readtraining/Adam/Variable/read*
T0* 
_output_shapes
:
��2
Z
training/Adam/sub_2/xConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
d
training/Adam/sub_2Subtraining/Adam/sub_2/xAdam/beta_1/read*
T0*
_output_shapes
: 
q
'training/Adam/mul_2/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
s
)training/Adam/mul_2/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
s
)training/Adam/mul_2/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
!training/Adam/mul_2/strided_sliceStridedSliceAtraining/Adam/gradients/embedding_1/embedding_lookup_grad/ToInt32'training/Adam/mul_2/strided_slice/stack)training/Adam/mul_2/strided_slice/stack_1)training/Adam/mul_2/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
�
training/Adam/mul_2/yUnsortedSegmentSumAtraining/Adam/gradients/embedding_1/embedding_lookup_grad/ReshapeCtraining/Adam/gradients/embedding_1/embedding_lookup_grad/Reshape_1!training/Adam/mul_2/strided_slice*
Tnumsegments0*
Tindices0*
T0* 
_output_shapes
:
��2
q
training/Adam/mul_2Multraining/Adam/sub_2training/Adam/mul_2/y*
T0* 
_output_shapes
:
��2
o
training/Adam/add_1Addtraining/Adam/mul_1training/Adam/mul_2* 
_output_shapes
:
��2*
T0
v
training/Adam/mul_3MulAdam/beta_2/readtraining/Adam/Variable_6/read*
T0* 
_output_shapes
:
��2
Z
training/Adam/sub_3/xConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
d
training/Adam/sub_3Subtraining/Adam/sub_3/xAdam/beta_2/read*
T0*
_output_shapes
: 
r
(training/Adam/Square/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
t
*training/Adam/Square/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
t
*training/Adam/Square/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
"training/Adam/Square/strided_sliceStridedSliceAtraining/Adam/gradients/embedding_1/embedding_lookup_grad/ToInt32(training/Adam/Square/strided_slice/stack*training/Adam/Square/strided_slice/stack_1*training/Adam/Square/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
�
training/Adam/Square/xUnsortedSegmentSumAtraining/Adam/gradients/embedding_1/embedding_lookup_grad/ReshapeCtraining/Adam/gradients/embedding_1/embedding_lookup_grad/Reshape_1"training/Adam/Square/strided_slice* 
_output_shapes
:
��2*
Tnumsegments0*
Tindices0*
T0
a
training/Adam/SquareSquaretraining/Adam/Square/x*
T0* 
_output_shapes
:
��2
p
training/Adam/mul_4Multraining/Adam/sub_3training/Adam/Square* 
_output_shapes
:
��2*
T0
o
training/Adam/add_2Addtraining/Adam/mul_3training/Adam/mul_4*
T0* 
_output_shapes
:
��2
m
training/Adam/mul_5Multraining/Adam/multraining/Adam/add_1* 
_output_shapes
:
��2*
T0
Z
training/Adam/Const_2Const*
dtype0*
_output_shapes
: *
valueB
 *    
Z
training/Adam/Const_3Const*
valueB
 *  �*
dtype0*
_output_shapes
: 
�
%training/Adam/clip_by_value_1/MinimumMinimumtraining/Adam/add_2training/Adam/Const_3* 
_output_shapes
:
��2*
T0
�
training/Adam/clip_by_value_1Maximum%training/Adam/clip_by_value_1/Minimumtraining/Adam/Const_2* 
_output_shapes
:
��2*
T0
f
training/Adam/Sqrt_1Sqrttraining/Adam/clip_by_value_1*
T0* 
_output_shapes
:
��2
Z
training/Adam/add_3/yConst*
dtype0*
_output_shapes
: *
valueB
 *���3
r
training/Adam/add_3Addtraining/Adam/Sqrt_1training/Adam/add_3/y*
T0* 
_output_shapes
:
��2
w
training/Adam/truediv_1RealDivtraining/Adam/mul_5training/Adam/add_3*
T0* 
_output_shapes
:
��2
{
training/Adam/sub_4Subembedding_1/embeddings/readtraining/Adam/truediv_1*
T0* 
_output_shapes
:
��2
�
training/Adam/AssignAssigntraining/Adam/Variabletraining/Adam/add_1*
validate_shape(* 
_output_shapes
:
��2*
use_locking(*
T0*)
_class
loc:@training/Adam/Variable
�
training/Adam/Assign_1Assigntraining/Adam/Variable_6training/Adam/add_2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_6*
validate_shape(* 
_output_shapes
:
��2
�
training/Adam/Assign_2Assignembedding_1/embeddingstraining/Adam/sub_4*
use_locking(*
T0*)
_class
loc:@embedding_1/embeddings*
validate_shape(* 
_output_shapes
:
��2
u
training/Adam/mul_6MulAdam/beta_1/readtraining/Adam/Variable_1/read*
T0*
_output_shapes
:	�2
Z
training/Adam/sub_5/xConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
d
training/Adam/sub_5Subtraining/Adam/sub_5/xAdam/beta_1/read*
_output_shapes
: *
T0
q
'training/Adam/mul_7/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
s
)training/Adam/mul_7/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
s
)training/Adam/mul_7/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
!training/Adam/mul_7/strided_sliceStridedSliceAtraining/Adam/gradients/embedding_2/embedding_lookup_grad/ToInt32'training/Adam/mul_7/strided_slice/stack)training/Adam/mul_7/strided_slice/stack_1)training/Adam/mul_7/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
�
training/Adam/mul_7/yUnsortedSegmentSumAtraining/Adam/gradients/embedding_2/embedding_lookup_grad/ReshapeCtraining/Adam/gradients/embedding_2/embedding_lookup_grad/Reshape_1!training/Adam/mul_7/strided_slice*
T0*
_output_shapes
:	�2*
Tnumsegments0*
Tindices0
p
training/Adam/mul_7Multraining/Adam/sub_5training/Adam/mul_7/y*
_output_shapes
:	�2*
T0
n
training/Adam/add_4Addtraining/Adam/mul_6training/Adam/mul_7*
T0*
_output_shapes
:	�2
u
training/Adam/mul_8MulAdam/beta_2/readtraining/Adam/Variable_7/read*
T0*
_output_shapes
:	�2
Z
training/Adam/sub_6/xConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
d
training/Adam/sub_6Subtraining/Adam/sub_6/xAdam/beta_2/read*
T0*
_output_shapes
: 
t
*training/Adam/Square_1/strided_slice/stackConst*
_output_shapes
:*
valueB: *
dtype0
v
,training/Adam/Square_1/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
v
,training/Adam/Square_1/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
$training/Adam/Square_1/strided_sliceStridedSliceAtraining/Adam/gradients/embedding_2/embedding_lookup_grad/ToInt32*training/Adam/Square_1/strided_slice/stack,training/Adam/Square_1/strided_slice/stack_1,training/Adam/Square_1/strided_slice/stack_2*
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask 
�
training/Adam/Square_1/xUnsortedSegmentSumAtraining/Adam/gradients/embedding_2/embedding_lookup_grad/ReshapeCtraining/Adam/gradients/embedding_2/embedding_lookup_grad/Reshape_1$training/Adam/Square_1/strided_slice*
_output_shapes
:	�2*
Tnumsegments0*
Tindices0*
T0
d
training/Adam/Square_1Squaretraining/Adam/Square_1/x*
T0*
_output_shapes
:	�2
q
training/Adam/mul_9Multraining/Adam/sub_6training/Adam/Square_1*
T0*
_output_shapes
:	�2
n
training/Adam/add_5Addtraining/Adam/mul_8training/Adam/mul_9*
_output_shapes
:	�2*
T0
m
training/Adam/mul_10Multraining/Adam/multraining/Adam/add_4*
_output_shapes
:	�2*
T0
Z
training/Adam/Const_4Const*
valueB
 *    *
dtype0*
_output_shapes
: 
Z
training/Adam/Const_5Const*
valueB
 *  �*
dtype0*
_output_shapes
: 
�
%training/Adam/clip_by_value_2/MinimumMinimumtraining/Adam/add_5training/Adam/Const_5*
_output_shapes
:	�2*
T0
�
training/Adam/clip_by_value_2Maximum%training/Adam/clip_by_value_2/Minimumtraining/Adam/Const_4*
T0*
_output_shapes
:	�2
e
training/Adam/Sqrt_2Sqrttraining/Adam/clip_by_value_2*
T0*
_output_shapes
:	�2
Z
training/Adam/add_6/yConst*
valueB
 *���3*
dtype0*
_output_shapes
: 
q
training/Adam/add_6Addtraining/Adam/Sqrt_2training/Adam/add_6/y*
_output_shapes
:	�2*
T0
w
training/Adam/truediv_2RealDivtraining/Adam/mul_10training/Adam/add_6*
T0*
_output_shapes
:	�2
z
training/Adam/sub_7Subembedding_2/embeddings/readtraining/Adam/truediv_2*
_output_shapes
:	�2*
T0
�
training/Adam/Assign_3Assigntraining/Adam/Variable_1training/Adam/add_4*
validate_shape(*
_output_shapes
:	�2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_1
�
training/Adam/Assign_4Assigntraining/Adam/Variable_7training/Adam/add_5*
_output_shapes
:	�2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_7*
validate_shape(
�
training/Adam/Assign_5Assignembedding_2/embeddingstraining/Adam/sub_7*
use_locking(*
T0*)
_class
loc:@embedding_2/embeddings*
validate_shape(*
_output_shapes
:	�2
u
training/Adam/mul_11MulAdam/beta_1/readtraining/Adam/Variable_2/read*
_output_shapes

:d2*
T0
Z
training/Adam/sub_8/xConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
d
training/Adam/sub_8Subtraining/Adam/sub_8/xAdam/beta_1/read*
T0*
_output_shapes
: 
�
training/Adam/mul_12Multraining/Adam/sub_84training/Adam/gradients/dense_1/MatMul_grad/MatMul_1*
T0*
_output_shapes

:d2
o
training/Adam/add_7Addtraining/Adam/mul_11training/Adam/mul_12*
T0*
_output_shapes

:d2
u
training/Adam/mul_13MulAdam/beta_2/readtraining/Adam/Variable_8/read*
T0*
_output_shapes

:d2
Z
training/Adam/sub_9/xConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
d
training/Adam/sub_9Subtraining/Adam/sub_9/xAdam/beta_2/read*
T0*
_output_shapes
: 

training/Adam/Square_2Square4training/Adam/gradients/dense_1/MatMul_grad/MatMul_1*
T0*
_output_shapes

:d2
q
training/Adam/mul_14Multraining/Adam/sub_9training/Adam/Square_2*
_output_shapes

:d2*
T0
o
training/Adam/add_8Addtraining/Adam/mul_13training/Adam/mul_14*
_output_shapes

:d2*
T0
l
training/Adam/mul_15Multraining/Adam/multraining/Adam/add_7*
T0*
_output_shapes

:d2
Z
training/Adam/Const_6Const*
valueB
 *    *
dtype0*
_output_shapes
: 
Z
training/Adam/Const_7Const*
valueB
 *  �*
dtype0*
_output_shapes
: 
�
%training/Adam/clip_by_value_3/MinimumMinimumtraining/Adam/add_8training/Adam/Const_7*
T0*
_output_shapes

:d2
�
training/Adam/clip_by_value_3Maximum%training/Adam/clip_by_value_3/Minimumtraining/Adam/Const_6*
T0*
_output_shapes

:d2
d
training/Adam/Sqrt_3Sqrttraining/Adam/clip_by_value_3*
_output_shapes

:d2*
T0
Z
training/Adam/add_9/yConst*
dtype0*
_output_shapes
: *
valueB
 *���3
p
training/Adam/add_9Addtraining/Adam/Sqrt_3training/Adam/add_9/y*
_output_shapes

:d2*
T0
v
training/Adam/truediv_3RealDivtraining/Adam/mul_15training/Adam/add_9*
T0*
_output_shapes

:d2
r
training/Adam/sub_10Subdense_1/kernel/readtraining/Adam/truediv_3*
_output_shapes

:d2*
T0
�
training/Adam/Assign_6Assigntraining/Adam/Variable_2training/Adam/add_7*
T0*+
_class!
loc:@training/Adam/Variable_2*
validate_shape(*
_output_shapes

:d2*
use_locking(
�
training/Adam/Assign_7Assigntraining/Adam/Variable_8training/Adam/add_8*
validate_shape(*
_output_shapes

:d2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_8
�
training/Adam/Assign_8Assigndense_1/kerneltraining/Adam/sub_10*!
_class
loc:@dense_1/kernel*
validate_shape(*
_output_shapes

:d2*
use_locking(*
T0
q
training/Adam/mul_16MulAdam/beta_1/readtraining/Adam/Variable_3/read*
_output_shapes
:2*
T0
[
training/Adam/sub_11/xConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
f
training/Adam/sub_11Subtraining/Adam/sub_11/xAdam/beta_1/read*
T0*
_output_shapes
: 
�
training/Adam/mul_17Multraining/Adam/sub_118training/Adam/gradients/dense_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:2
l
training/Adam/add_10Addtraining/Adam/mul_16training/Adam/mul_17*
_output_shapes
:2*
T0
q
training/Adam/mul_18MulAdam/beta_2/readtraining/Adam/Variable_9/read*
T0*
_output_shapes
:2
[
training/Adam/sub_12/xConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
f
training/Adam/sub_12Subtraining/Adam/sub_12/xAdam/beta_2/read*
_output_shapes
: *
T0

training/Adam/Square_3Square8training/Adam/gradients/dense_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:2
n
training/Adam/mul_19Multraining/Adam/sub_12training/Adam/Square_3*
T0*
_output_shapes
:2
l
training/Adam/add_11Addtraining/Adam/mul_18training/Adam/mul_19*
_output_shapes
:2*
T0
i
training/Adam/mul_20Multraining/Adam/multraining/Adam/add_10*
T0*
_output_shapes
:2
Z
training/Adam/Const_8Const*
valueB
 *    *
dtype0*
_output_shapes
: 
Z
training/Adam/Const_9Const*
valueB
 *  �*
dtype0*
_output_shapes
: 
�
%training/Adam/clip_by_value_4/MinimumMinimumtraining/Adam/add_11training/Adam/Const_9*
T0*
_output_shapes
:2
�
training/Adam/clip_by_value_4Maximum%training/Adam/clip_by_value_4/Minimumtraining/Adam/Const_8*
_output_shapes
:2*
T0
`
training/Adam/Sqrt_4Sqrttraining/Adam/clip_by_value_4*
_output_shapes
:2*
T0
[
training/Adam/add_12/yConst*
_output_shapes
: *
valueB
 *���3*
dtype0
n
training/Adam/add_12Addtraining/Adam/Sqrt_4training/Adam/add_12/y*
T0*
_output_shapes
:2
s
training/Adam/truediv_4RealDivtraining/Adam/mul_20training/Adam/add_12*
T0*
_output_shapes
:2
l
training/Adam/sub_13Subdense_1/bias/readtraining/Adam/truediv_4*
T0*
_output_shapes
:2
�
training/Adam/Assign_9Assigntraining/Adam/Variable_3training/Adam/add_10*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_3*
validate_shape(*
_output_shapes
:2
�
training/Adam/Assign_10Assigntraining/Adam/Variable_9training/Adam/add_11*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_9*
validate_shape(*
_output_shapes
:2
�
training/Adam/Assign_11Assigndense_1/biastraining/Adam/sub_13*
T0*
_class
loc:@dense_1/bias*
validate_shape(*
_output_shapes
:2*
use_locking(
u
training/Adam/mul_21MulAdam/beta_1/readtraining/Adam/Variable_4/read*
T0*
_output_shapes

:2
[
training/Adam/sub_14/xConst*
_output_shapes
: *
valueB
 *  �?*
dtype0
f
training/Adam/sub_14Subtraining/Adam/sub_14/xAdam/beta_1/read*
_output_shapes
: *
T0
�
training/Adam/mul_22Multraining/Adam/sub_144training/Adam/gradients/dense_2/MatMul_grad/MatMul_1*
T0*
_output_shapes

:2
p
training/Adam/add_13Addtraining/Adam/mul_21training/Adam/mul_22*
T0*
_output_shapes

:2
v
training/Adam/mul_23MulAdam/beta_2/readtraining/Adam/Variable_10/read*
T0*
_output_shapes

:2
[
training/Adam/sub_15/xConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
f
training/Adam/sub_15Subtraining/Adam/sub_15/xAdam/beta_2/read*
_output_shapes
: *
T0

training/Adam/Square_4Square4training/Adam/gradients/dense_2/MatMul_grad/MatMul_1*
_output_shapes

:2*
T0
r
training/Adam/mul_24Multraining/Adam/sub_15training/Adam/Square_4*
_output_shapes

:2*
T0
p
training/Adam/add_14Addtraining/Adam/mul_23training/Adam/mul_24*
T0*
_output_shapes

:2
m
training/Adam/mul_25Multraining/Adam/multraining/Adam/add_13*
_output_shapes

:2*
T0
[
training/Adam/Const_10Const*
valueB
 *    *
dtype0*
_output_shapes
: 
[
training/Adam/Const_11Const*
valueB
 *  �*
dtype0*
_output_shapes
: 
�
%training/Adam/clip_by_value_5/MinimumMinimumtraining/Adam/add_14training/Adam/Const_11*
_output_shapes

:2*
T0
�
training/Adam/clip_by_value_5Maximum%training/Adam/clip_by_value_5/Minimumtraining/Adam/Const_10*
T0*
_output_shapes

:2
d
training/Adam/Sqrt_5Sqrttraining/Adam/clip_by_value_5*
T0*
_output_shapes

:2
[
training/Adam/add_15/yConst*
valueB
 *���3*
dtype0*
_output_shapes
: 
r
training/Adam/add_15Addtraining/Adam/Sqrt_5training/Adam/add_15/y*
_output_shapes

:2*
T0
w
training/Adam/truediv_5RealDivtraining/Adam/mul_25training/Adam/add_15*
T0*
_output_shapes

:2
r
training/Adam/sub_16Subdense_2/kernel/readtraining/Adam/truediv_5*
_output_shapes

:2*
T0
�
training/Adam/Assign_12Assigntraining/Adam/Variable_4training/Adam/add_13*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_4*
validate_shape(*
_output_shapes

:2
�
training/Adam/Assign_13Assigntraining/Adam/Variable_10training/Adam/add_14*
validate_shape(*
_output_shapes

:2*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_10
�
training/Adam/Assign_14Assigndense_2/kerneltraining/Adam/sub_16*!
_class
loc:@dense_2/kernel*
validate_shape(*
_output_shapes

:2*
use_locking(*
T0
q
training/Adam/mul_26MulAdam/beta_1/readtraining/Adam/Variable_5/read*
_output_shapes
:*
T0
[
training/Adam/sub_17/xConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
f
training/Adam/sub_17Subtraining/Adam/sub_17/xAdam/beta_1/read*
T0*
_output_shapes
: 
�
training/Adam/mul_27Multraining/Adam/sub_178training/Adam/gradients/dense_2/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:
l
training/Adam/add_16Addtraining/Adam/mul_26training/Adam/mul_27*
_output_shapes
:*
T0
r
training/Adam/mul_28MulAdam/beta_2/readtraining/Adam/Variable_11/read*
_output_shapes
:*
T0
[
training/Adam/sub_18/xConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
f
training/Adam/sub_18Subtraining/Adam/sub_18/xAdam/beta_2/read*
T0*
_output_shapes
: 

training/Adam/Square_5Square8training/Adam/gradients/dense_2/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:
n
training/Adam/mul_29Multraining/Adam/sub_18training/Adam/Square_5*
T0*
_output_shapes
:
l
training/Adam/add_17Addtraining/Adam/mul_28training/Adam/mul_29*
_output_shapes
:*
T0
i
training/Adam/mul_30Multraining/Adam/multraining/Adam/add_16*
T0*
_output_shapes
:
[
training/Adam/Const_12Const*
valueB
 *    *
dtype0*
_output_shapes
: 
[
training/Adam/Const_13Const*
valueB
 *  �*
dtype0*
_output_shapes
: 
�
%training/Adam/clip_by_value_6/MinimumMinimumtraining/Adam/add_17training/Adam/Const_13*
T0*
_output_shapes
:
�
training/Adam/clip_by_value_6Maximum%training/Adam/clip_by_value_6/Minimumtraining/Adam/Const_12*
T0*
_output_shapes
:
`
training/Adam/Sqrt_6Sqrttraining/Adam/clip_by_value_6*
T0*
_output_shapes
:
[
training/Adam/add_18/yConst*
valueB
 *���3*
dtype0*
_output_shapes
: 
n
training/Adam/add_18Addtraining/Adam/Sqrt_6training/Adam/add_18/y*
_output_shapes
:*
T0
s
training/Adam/truediv_6RealDivtraining/Adam/mul_30training/Adam/add_18*
_output_shapes
:*
T0
l
training/Adam/sub_19Subdense_2/bias/readtraining/Adam/truediv_6*
T0*
_output_shapes
:
�
training/Adam/Assign_15Assigntraining/Adam/Variable_5training/Adam/add_16*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_5
�
training/Adam/Assign_16Assigntraining/Adam/Variable_11training/Adam/add_17*
_output_shapes
:*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_11*
validate_shape(
�
training/Adam/Assign_17Assigndense_2/biastraining/Adam/sub_19*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@dense_2/bias
�
training/group_depsNoOp	^loss/mul^training/Adam/Assign^training/Adam/AssignAdd^training/Adam/Assign_1^training/Adam/Assign_10^training/Adam/Assign_11^training/Adam/Assign_12^training/Adam/Assign_13^training/Adam/Assign_14^training/Adam/Assign_15^training/Adam/Assign_16^training/Adam/Assign_17^training/Adam/Assign_2^training/Adam/Assign_3^training/Adam/Assign_4^training/Adam/Assign_5^training/Adam/Assign_6^training/Adam/Assign_7^training/Adam/Assign_8^training/Adam/Assign_9


group_depsNoOp	^loss/mul
�
IsVariableInitializedIsVariableInitializedembedding_1/embeddings*)
_class
loc:@embedding_1/embeddings*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_1IsVariableInitializedembedding_2/embeddings*)
_class
loc:@embedding_2/embeddings*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_2IsVariableInitializeddense_1/kernel*!
_class
loc:@dense_1/kernel*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_3IsVariableInitializeddense_1/bias*
dtype0*
_output_shapes
: *
_class
loc:@dense_1/bias
�
IsVariableInitialized_4IsVariableInitializeddense_2/kernel*!
_class
loc:@dense_2/kernel*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_5IsVariableInitializeddense_2/bias*
_class
loc:@dense_2/bias*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_6IsVariableInitializedAdam/iterations*"
_class
loc:@Adam/iterations*
dtype0	*
_output_shapes
: 
z
IsVariableInitialized_7IsVariableInitializedAdam/lr*
_class
loc:@Adam/lr*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_8IsVariableInitializedAdam/beta_1*
_class
loc:@Adam/beta_1*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_9IsVariableInitializedAdam/beta_2*
_class
loc:@Adam/beta_2*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_10IsVariableInitialized
Adam/decay*
_output_shapes
: *
_class
loc:@Adam/decay*
dtype0
�
IsVariableInitialized_11IsVariableInitializedtraining/Adam/Variable*)
_class
loc:@training/Adam/Variable*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_12IsVariableInitializedtraining/Adam/Variable_1*+
_class!
loc:@training/Adam/Variable_1*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_13IsVariableInitializedtraining/Adam/Variable_2*+
_class!
loc:@training/Adam/Variable_2*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_14IsVariableInitializedtraining/Adam/Variable_3*+
_class!
loc:@training/Adam/Variable_3*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_15IsVariableInitializedtraining/Adam/Variable_4*+
_class!
loc:@training/Adam/Variable_4*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_16IsVariableInitializedtraining/Adam/Variable_5*+
_class!
loc:@training/Adam/Variable_5*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_17IsVariableInitializedtraining/Adam/Variable_6*
dtype0*
_output_shapes
: *+
_class!
loc:@training/Adam/Variable_6
�
IsVariableInitialized_18IsVariableInitializedtraining/Adam/Variable_7*+
_class!
loc:@training/Adam/Variable_7*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_19IsVariableInitializedtraining/Adam/Variable_8*+
_class!
loc:@training/Adam/Variable_8*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_20IsVariableInitializedtraining/Adam/Variable_9*+
_class!
loc:@training/Adam/Variable_9*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_21IsVariableInitializedtraining/Adam/Variable_10*,
_class"
 loc:@training/Adam/Variable_10*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_22IsVariableInitializedtraining/Adam/Variable_11*,
_class"
 loc:@training/Adam/Variable_11*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_23IsVariableInitializedtraining/Adam/Variable_12*,
_class"
 loc:@training/Adam/Variable_12*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_24IsVariableInitializedtraining/Adam/Variable_13*
dtype0*
_output_shapes
: *,
_class"
 loc:@training/Adam/Variable_13
�
IsVariableInitialized_25IsVariableInitializedtraining/Adam/Variable_14*
dtype0*
_output_shapes
: *,
_class"
 loc:@training/Adam/Variable_14
�
IsVariableInitialized_26IsVariableInitializedtraining/Adam/Variable_15*,
_class"
 loc:@training/Adam/Variable_15*
dtype0*
_output_shapes
: 
�
IsVariableInitialized_27IsVariableInitializedtraining/Adam/Variable_16*
_output_shapes
: *,
_class"
 loc:@training/Adam/Variable_16*
dtype0
�
IsVariableInitialized_28IsVariableInitializedtraining/Adam/Variable_17*
dtype0*
_output_shapes
: *,
_class"
 loc:@training/Adam/Variable_17
�
initNoOp^Adam/beta_1/Assign^Adam/beta_2/Assign^Adam/decay/Assign^Adam/iterations/Assign^Adam/lr/Assign^dense_1/bias/Assign^dense_1/kernel/Assign^dense_2/bias/Assign^dense_2/kernel/Assign^embedding_1/embeddings/Assign^embedding_2/embeddings/Assign^training/Adam/Variable/Assign ^training/Adam/Variable_1/Assign!^training/Adam/Variable_10/Assign!^training/Adam/Variable_11/Assign!^training/Adam/Variable_12/Assign!^training/Adam/Variable_13/Assign!^training/Adam/Variable_14/Assign!^training/Adam/Variable_15/Assign!^training/Adam/Variable_16/Assign!^training/Adam/Variable_17/Assign ^training/Adam/Variable_2/Assign ^training/Adam/Variable_3/Assign ^training/Adam/Variable_4/Assign ^training/Adam/Variable_5/Assign ^training/Adam/Variable_6/Assign ^training/Adam/Variable_7/Assign ^training/Adam/Variable_8/Assign ^training/Adam/Variable_9/Assign
]
strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
_
strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
_
strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
strided_sliceStridedSlicedense_2/BiasAddstrided_slice/stackstrided_slice/stack_1strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
:*
Index0*
T0
_
strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
a
strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
a
strided_slice_1/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
�
strided_slice_1StridedSlicedense_2/BiasAddstrided_slice_1/stackstrided_slice_1/stack_1strided_slice_1/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
:
O
ConstConst*
valueBB1*
dtype0*
_output_shapes
:

init_all_tablesNoOp
(
legacy_init_opNoOp^init_all_tables
Y
save/filename/inputConst*
dtype0*
_output_shapes
: *
valueB Bmodel
n
save/filenamePlaceholderWithDefaultsave/filename/input*
dtype0*
_output_shapes
: *
shape: 
e

save/ConstPlaceholderWithDefaultsave/filename*
dtype0*
_output_shapes
: *
shape: 
�
save/StringJoin/inputs_1Const*<
value3B1 B+_temp_845bce29ea1b4a8cae242777fe5bcdb7/part*
dtype0*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
k
save/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
�
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
�
save/SaveV2/tensor_namesConst"/device:CPU:0*�
value�B�BAdam/beta_1BAdam/beta_2B
Adam/decayBAdam/iterationsBAdam/lrBdense_1/biasBdense_1/kernelBdense_2/biasBdense_2/kernelBembedding_1/embeddingsBembedding_2/embeddingsBtraining/Adam/VariableBtraining/Adam/Variable_1Btraining/Adam/Variable_10Btraining/Adam/Variable_11Btraining/Adam/Variable_12Btraining/Adam/Variable_13Btraining/Adam/Variable_14Btraining/Adam/Variable_15Btraining/Adam/Variable_16Btraining/Adam/Variable_17Btraining/Adam/Variable_2Btraining/Adam/Variable_3Btraining/Adam/Variable_4Btraining/Adam/Variable_5Btraining/Adam/Variable_6Btraining/Adam/Variable_7Btraining/Adam/Variable_8Btraining/Adam/Variable_9*
dtype0*
_output_shapes
:
�
save/SaveV2/shape_and_slicesConst"/device:CPU:0*M
valueDBBB B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesAdam/beta_1Adam/beta_2
Adam/decayAdam/iterationsAdam/lrdense_1/biasdense_1/kerneldense_2/biasdense_2/kernelembedding_1/embeddingsembedding_2/embeddingstraining/Adam/Variabletraining/Adam/Variable_1training/Adam/Variable_10training/Adam/Variable_11training/Adam/Variable_12training/Adam/Variable_13training/Adam/Variable_14training/Adam/Variable_15training/Adam/Variable_16training/Adam/Variable_17training/Adam/Variable_2training/Adam/Variable_3training/Adam/Variable_4training/Adam/Variable_5training/Adam/Variable_6training/Adam/Variable_7training/Adam/Variable_8training/Adam/Variable_9"/device:CPU:0*+
dtypes!
2	
�
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
_output_shapes
: *
T0*'
_class
loc:@save/ShardedFilename
�
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
_output_shapes
:*
T0*

axis *
N
�
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0*
delete_old_dirs(
�
save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
T0*
_output_shapes
: 
�
save/RestoreV2/tensor_namesConst"/device:CPU:0*�
value�B�BAdam/beta_1BAdam/beta_2B
Adam/decayBAdam/iterationsBAdam/lrBdense_1/biasBdense_1/kernelBdense_2/biasBdense_2/kernelBembedding_1/embeddingsBembedding_2/embeddingsBtraining/Adam/VariableBtraining/Adam/Variable_1Btraining/Adam/Variable_10Btraining/Adam/Variable_11Btraining/Adam/Variable_12Btraining/Adam/Variable_13Btraining/Adam/Variable_14Btraining/Adam/Variable_15Btraining/Adam/Variable_16Btraining/Adam/Variable_17Btraining/Adam/Variable_2Btraining/Adam/Variable_3Btraining/Adam/Variable_4Btraining/Adam/Variable_5Btraining/Adam/Variable_6Btraining/Adam/Variable_7Btraining/Adam/Variable_8Btraining/Adam/Variable_9*
dtype0*
_output_shapes
:
�
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*M
valueDBBB B B B B B B B B B B B B B B B B B B B B B B B B B B B B 
�
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*�
_output_shapesv
t:::::::::::::::::::::::::::::*+
dtypes!
2	
�
save/AssignAssignAdam/beta_1save/RestoreV2*
_output_shapes
: *
use_locking(*
T0*
_class
loc:@Adam/beta_1*
validate_shape(
�
save/Assign_1AssignAdam/beta_2save/RestoreV2:1*
_output_shapes
: *
use_locking(*
T0*
_class
loc:@Adam/beta_2*
validate_shape(
�
save/Assign_2Assign
Adam/decaysave/RestoreV2:2*
T0*
_class
loc:@Adam/decay*
validate_shape(*
_output_shapes
: *
use_locking(
�
save/Assign_3AssignAdam/iterationssave/RestoreV2:3*
use_locking(*
T0	*"
_class
loc:@Adam/iterations*
validate_shape(*
_output_shapes
: 
�
save/Assign_4AssignAdam/lrsave/RestoreV2:4*
use_locking(*
T0*
_class
loc:@Adam/lr*
validate_shape(*
_output_shapes
: 
�
save/Assign_5Assigndense_1/biassave/RestoreV2:5*
use_locking(*
T0*
_class
loc:@dense_1/bias*
validate_shape(*
_output_shapes
:2
�
save/Assign_6Assigndense_1/kernelsave/RestoreV2:6*
_output_shapes

:d2*
use_locking(*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(
�
save/Assign_7Assigndense_2/biassave/RestoreV2:7*
use_locking(*
T0*
_class
loc:@dense_2/bias*
validate_shape(*
_output_shapes
:
�
save/Assign_8Assigndense_2/kernelsave/RestoreV2:8*
use_locking(*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(*
_output_shapes

:2
�
save/Assign_9Assignembedding_1/embeddingssave/RestoreV2:9*
use_locking(*
T0*)
_class
loc:@embedding_1/embeddings*
validate_shape(* 
_output_shapes
:
��2
�
save/Assign_10Assignembedding_2/embeddingssave/RestoreV2:10*
validate_shape(*
_output_shapes
:	�2*
use_locking(*
T0*)
_class
loc:@embedding_2/embeddings
�
save/Assign_11Assigntraining/Adam/Variablesave/RestoreV2:11*
validate_shape(* 
_output_shapes
:
��2*
use_locking(*
T0*)
_class
loc:@training/Adam/Variable
�
save/Assign_12Assigntraining/Adam/Variable_1save/RestoreV2:12*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_1*
validate_shape(*
_output_shapes
:	�2
�
save/Assign_13Assigntraining/Adam/Variable_10save/RestoreV2:13*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_10*
validate_shape(*
_output_shapes

:2
�
save/Assign_14Assigntraining/Adam/Variable_11save/RestoreV2:14*,
_class"
 loc:@training/Adam/Variable_11*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save/Assign_15Assigntraining/Adam/Variable_12save/RestoreV2:15*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_12*
validate_shape(*
_output_shapes
:
�
save/Assign_16Assigntraining/Adam/Variable_13save/RestoreV2:16*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_13*
validate_shape(*
_output_shapes
:
�
save/Assign_17Assigntraining/Adam/Variable_14save/RestoreV2:17*
T0*,
_class"
 loc:@training/Adam/Variable_14*
validate_shape(*
_output_shapes
:*
use_locking(
�
save/Assign_18Assigntraining/Adam/Variable_15save/RestoreV2:18*,
_class"
 loc:@training/Adam/Variable_15*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save/Assign_19Assigntraining/Adam/Variable_16save/RestoreV2:19*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_16*
validate_shape(*
_output_shapes
:
�
save/Assign_20Assigntraining/Adam/Variable_17save/RestoreV2:20*
_output_shapes
:*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_17*
validate_shape(
�
save/Assign_21Assigntraining/Adam/Variable_2save/RestoreV2:21*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_2*
validate_shape(*
_output_shapes

:d2
�
save/Assign_22Assigntraining/Adam/Variable_3save/RestoreV2:22*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_3*
validate_shape(*
_output_shapes
:2
�
save/Assign_23Assigntraining/Adam/Variable_4save/RestoreV2:23*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_4*
validate_shape(*
_output_shapes

:2
�
save/Assign_24Assigntraining/Adam/Variable_5save/RestoreV2:24*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_5*
validate_shape(*
_output_shapes
:
�
save/Assign_25Assigntraining/Adam/Variable_6save/RestoreV2:25*
T0*+
_class!
loc:@training/Adam/Variable_6*
validate_shape(* 
_output_shapes
:
��2*
use_locking(
�
save/Assign_26Assigntraining/Adam/Variable_7save/RestoreV2:26*
_output_shapes
:	�2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_7*
validate_shape(
�
save/Assign_27Assigntraining/Adam/Variable_8save/RestoreV2:27*+
_class!
loc:@training/Adam/Variable_8*
validate_shape(*
_output_shapes

:d2*
use_locking(*
T0
�
save/Assign_28Assigntraining/Adam/Variable_9save/RestoreV2:28*
validate_shape(*
_output_shapes
:2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_9
�
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_2^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_23^save/Assign_24^save/Assign_25^save/Assign_26^save/Assign_27^save/Assign_28^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9
-
save/restore_allNoOp^save/restore_shard"<
save/Const:0save/Identity:0save/restore_all (5 @F8"�
trainable_variables��
x
embedding_1/embeddings:0embedding_1/embeddings/Assignembedding_1/embeddings/read:02embedding_1/random_uniform:08
x
embedding_2/embeddings:0embedding_2/embeddings/Assignembedding_2/embeddings/read:02embedding_2/random_uniform:08
\
dense_1/kernel:0dense_1/kernel/Assigndense_1/kernel/read:02dense_1/random_uniform:08
M
dense_1/bias:0dense_1/bias/Assigndense_1/bias/read:02dense_1/Const:08
\
dense_2/kernel:0dense_2/kernel/Assigndense_2/kernel/read:02dense_2/random_uniform:08
M
dense_2/bias:0dense_2/bias/Assigndense_2/bias/read:02dense_2/Const:08
f
Adam/iterations:0Adam/iterations/AssignAdam/iterations/read:02Adam/iterations/initial_value:08
F
	Adam/lr:0Adam/lr/AssignAdam/lr/read:02Adam/lr/initial_value:08
V
Adam/beta_1:0Adam/beta_1/AssignAdam/beta_1/read:02Adam/beta_1/initial_value:08
V
Adam/beta_2:0Adam/beta_2/AssignAdam/beta_2/read:02Adam/beta_2/initial_value:08
R
Adam/decay:0Adam/decay/AssignAdam/decay/read:02Adam/decay/initial_value:08
q
training/Adam/Variable:0training/Adam/Variable/Assigntraining/Adam/Variable/read:02training/Adam/zeros:08
y
training/Adam/Variable_1:0training/Adam/Variable_1/Assigntraining/Adam/Variable_1/read:02training/Adam/zeros_1:08
y
training/Adam/Variable_2:0training/Adam/Variable_2/Assigntraining/Adam/Variable_2/read:02training/Adam/zeros_2:08
y
training/Adam/Variable_3:0training/Adam/Variable_3/Assigntraining/Adam/Variable_3/read:02training/Adam/zeros_3:08
y
training/Adam/Variable_4:0training/Adam/Variable_4/Assigntraining/Adam/Variable_4/read:02training/Adam/zeros_4:08
y
training/Adam/Variable_5:0training/Adam/Variable_5/Assigntraining/Adam/Variable_5/read:02training/Adam/zeros_5:08
y
training/Adam/Variable_6:0training/Adam/Variable_6/Assigntraining/Adam/Variable_6/read:02training/Adam/zeros_6:08
y
training/Adam/Variable_7:0training/Adam/Variable_7/Assigntraining/Adam/Variable_7/read:02training/Adam/zeros_7:08
y
training/Adam/Variable_8:0training/Adam/Variable_8/Assigntraining/Adam/Variable_8/read:02training/Adam/zeros_8:08
y
training/Adam/Variable_9:0training/Adam/Variable_9/Assigntraining/Adam/Variable_9/read:02training/Adam/zeros_9:08
}
training/Adam/Variable_10:0 training/Adam/Variable_10/Assign training/Adam/Variable_10/read:02training/Adam/zeros_10:08
}
training/Adam/Variable_11:0 training/Adam/Variable_11/Assign training/Adam/Variable_11/read:02training/Adam/zeros_11:08
}
training/Adam/Variable_12:0 training/Adam/Variable_12/Assign training/Adam/Variable_12/read:02training/Adam/zeros_12:08
}
training/Adam/Variable_13:0 training/Adam/Variable_13/Assign training/Adam/Variable_13/read:02training/Adam/zeros_13:08
}
training/Adam/Variable_14:0 training/Adam/Variable_14/Assign training/Adam/Variable_14/read:02training/Adam/zeros_14:08
}
training/Adam/Variable_15:0 training/Adam/Variable_15/Assign training/Adam/Variable_15/read:02training/Adam/zeros_15:08
}
training/Adam/Variable_16:0 training/Adam/Variable_16/Assign training/Adam/Variable_16/read:02training/Adam/zeros_16:08
}
training/Adam/Variable_17:0 training/Adam/Variable_17/Assign training/Adam/Variable_17/read:02training/Adam/zeros_17:08"�
	variables��
x
embedding_1/embeddings:0embedding_1/embeddings/Assignembedding_1/embeddings/read:02embedding_1/random_uniform:08
x
embedding_2/embeddings:0embedding_2/embeddings/Assignembedding_2/embeddings/read:02embedding_2/random_uniform:08
\
dense_1/kernel:0dense_1/kernel/Assigndense_1/kernel/read:02dense_1/random_uniform:08
M
dense_1/bias:0dense_1/bias/Assigndense_1/bias/read:02dense_1/Const:08
\
dense_2/kernel:0dense_2/kernel/Assigndense_2/kernel/read:02dense_2/random_uniform:08
M
dense_2/bias:0dense_2/bias/Assigndense_2/bias/read:02dense_2/Const:08
f
Adam/iterations:0Adam/iterations/AssignAdam/iterations/read:02Adam/iterations/initial_value:08
F
	Adam/lr:0Adam/lr/AssignAdam/lr/read:02Adam/lr/initial_value:08
V
Adam/beta_1:0Adam/beta_1/AssignAdam/beta_1/read:02Adam/beta_1/initial_value:08
V
Adam/beta_2:0Adam/beta_2/AssignAdam/beta_2/read:02Adam/beta_2/initial_value:08
R
Adam/decay:0Adam/decay/AssignAdam/decay/read:02Adam/decay/initial_value:08
q
training/Adam/Variable:0training/Adam/Variable/Assigntraining/Adam/Variable/read:02training/Adam/zeros:08
y
training/Adam/Variable_1:0training/Adam/Variable_1/Assigntraining/Adam/Variable_1/read:02training/Adam/zeros_1:08
y
training/Adam/Variable_2:0training/Adam/Variable_2/Assigntraining/Adam/Variable_2/read:02training/Adam/zeros_2:08
y
training/Adam/Variable_3:0training/Adam/Variable_3/Assigntraining/Adam/Variable_3/read:02training/Adam/zeros_3:08
y
training/Adam/Variable_4:0training/Adam/Variable_4/Assigntraining/Adam/Variable_4/read:02training/Adam/zeros_4:08
y
training/Adam/Variable_5:0training/Adam/Variable_5/Assigntraining/Adam/Variable_5/read:02training/Adam/zeros_5:08
y
training/Adam/Variable_6:0training/Adam/Variable_6/Assigntraining/Adam/Variable_6/read:02training/Adam/zeros_6:08
y
training/Adam/Variable_7:0training/Adam/Variable_7/Assigntraining/Adam/Variable_7/read:02training/Adam/zeros_7:08
y
training/Adam/Variable_8:0training/Adam/Variable_8/Assigntraining/Adam/Variable_8/read:02training/Adam/zeros_8:08
y
training/Adam/Variable_9:0training/Adam/Variable_9/Assigntraining/Adam/Variable_9/read:02training/Adam/zeros_9:08
}
training/Adam/Variable_10:0 training/Adam/Variable_10/Assign training/Adam/Variable_10/read:02training/Adam/zeros_10:08
}
training/Adam/Variable_11:0 training/Adam/Variable_11/Assign training/Adam/Variable_11/read:02training/Adam/zeros_11:08
}
training/Adam/Variable_12:0 training/Adam/Variable_12/Assign training/Adam/Variable_12/read:02training/Adam/zeros_12:08
}
training/Adam/Variable_13:0 training/Adam/Variable_13/Assign training/Adam/Variable_13/read:02training/Adam/zeros_13:08
}
training/Adam/Variable_14:0 training/Adam/Variable_14/Assign training/Adam/Variable_14/read:02training/Adam/zeros_14:08
}
training/Adam/Variable_15:0 training/Adam/Variable_15/Assign training/Adam/Variable_15/read:02training/Adam/zeros_15:08
}
training/Adam/Variable_16:0 training/Adam/Variable_16/Assign training/Adam/Variable_16/read:02training/Adam/zeros_16:08
}
training/Adam/Variable_17:0 training/Adam/Variable_17/Assign training/Adam/Variable_17/read:02training/Adam/zeros_17:08")
saved_model_main_op

legacy_init_op*�
serving_default�
,
products 
	product:0���������
&
users
user:0���������"
model-version
Const:0;
recommendations(
dense_2/BiasAdd:0���������tensorflow/serving/predict