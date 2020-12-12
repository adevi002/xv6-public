
_lab3:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
}
#pragma GCC pop_options

int
main(int argc, char *argv[])
{
    1000:	f3 0f 1e fb          	endbr32 
    1004:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1008:	83 e4 f0             	and    $0xfffffff0,%esp
    100b:	ff 71 fc             	pushl  -0x4(%ecx)
  int n, m;

  if(argc != 2){
    100e:	83 39 02             	cmpl   $0x2,(%ecx)
{
    1011:	55                   	push   %ebp
    1012:	89 e5                	mov    %esp,%ebp
    1014:	53                   	push   %ebx
    1015:	51                   	push   %ecx
    1016:	8b 41 04             	mov    0x4(%ecx),%eax
  if(argc != 2){
    1019:	74 14                	je     102f <main+0x2f>
    printf(1, "Usage: %s levels\n", argv[0]);
    101b:	52                   	push   %edx
    101c:	ff 30                	pushl  (%eax)
    101e:	68 18 18 00 00       	push   $0x1818
    1023:	6a 01                	push   $0x1
    1025:	e8 46 04 00 00       	call   1470 <printf>
    exit();
    102a:	e8 d4 02 00 00       	call   1303 <exit>
  }

  n = atoi(argv[1]);
    102f:	83 ec 0c             	sub    $0xc,%esp
    1032:	ff 70 04             	pushl  0x4(%eax)
    1035:	e8 56 02 00 00       	call   1290 <atoi>
  printf(1, "Lab 3: Recursing %d levels\n", n);
    103a:	83 c4 0c             	add    $0xc,%esp
    103d:	50                   	push   %eax
  n = atoi(argv[1]);
    103e:	89 c3                	mov    %eax,%ebx
  printf(1, "Lab 3: Recursing %d levels\n", n);
    1040:	68 2a 18 00 00       	push   $0x182a
    1045:	6a 01                	push   $0x1
    1047:	e8 24 04 00 00       	call   1470 <printf>
  m = recurse(n);
    104c:	89 1c 24             	mov    %ebx,(%esp)
    104f:	e8 1c 00 00 00       	call   1070 <recurse>
  printf(1, "Lab 3: Yielded a value of %d\n", m);
    1054:	83 c4 0c             	add    $0xc,%esp
    1057:	50                   	push   %eax
    1058:	68 46 18 00 00       	push   $0x1846
    105d:	6a 01                	push   $0x1
    105f:	e8 0c 04 00 00       	call   1470 <printf>
  exit();
    1064:	e8 9a 02 00 00       	call   1303 <exit>
    1069:	66 90                	xchg   %ax,%ax
    106b:	66 90                	xchg   %ax,%ax
    106d:	66 90                	xchg   %ax,%ax
    106f:	90                   	nop

00001070 <recurse>:
{
    1070:	f3 0f 1e fb          	endbr32 
    1074:	55                   	push   %ebp
    1075:	89 e5                	mov    %esp,%ebp
    1077:	83 ec 08             	sub    $0x8,%esp
  if(n == 0)
    107a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    107e:	75 07                	jne    1087 <recurse+0x17>
    return 0;
    1080:	b8 00 00 00 00       	mov    $0x0,%eax
    1085:	eb 17                	jmp    109e <recurse+0x2e>
  return n + recurse(n - 1);
    1087:	8b 45 08             	mov    0x8(%ebp),%eax
    108a:	83 e8 01             	sub    $0x1,%eax
    108d:	83 ec 0c             	sub    $0xc,%esp
    1090:	50                   	push   %eax
    1091:	e8 da ff ff ff       	call   1070 <recurse>
    1096:	83 c4 10             	add    $0x10,%esp
    1099:	8b 55 08             	mov    0x8(%ebp),%edx
    109c:	01 d0                	add    %edx,%eax
}
    109e:	c9                   	leave  
    109f:	c3                   	ret    

000010a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    10a0:	f3 0f 1e fb          	endbr32 
    10a4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    10a5:	31 c0                	xor    %eax,%eax
{
    10a7:	89 e5                	mov    %esp,%ebp
    10a9:	53                   	push   %ebx
    10aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
    10ad:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
    10b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    10b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    10b7:	83 c0 01             	add    $0x1,%eax
    10ba:	84 d2                	test   %dl,%dl
    10bc:	75 f2                	jne    10b0 <strcpy+0x10>
    ;
  return os;
}
    10be:	89 c8                	mov    %ecx,%eax
    10c0:	5b                   	pop    %ebx
    10c1:	5d                   	pop    %ebp
    10c2:	c3                   	ret    
    10c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000010d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10d0:	f3 0f 1e fb          	endbr32 
    10d4:	55                   	push   %ebp
    10d5:	89 e5                	mov    %esp,%ebp
    10d7:	53                   	push   %ebx
    10d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
    10db:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    10de:	0f b6 01             	movzbl (%ecx),%eax
    10e1:	0f b6 1a             	movzbl (%edx),%ebx
    10e4:	84 c0                	test   %al,%al
    10e6:	75 19                	jne    1101 <strcmp+0x31>
    10e8:	eb 26                	jmp    1110 <strcmp+0x40>
    10ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10f0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    10f4:	83 c1 01             	add    $0x1,%ecx
    10f7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10fa:	0f b6 1a             	movzbl (%edx),%ebx
    10fd:	84 c0                	test   %al,%al
    10ff:	74 0f                	je     1110 <strcmp+0x40>
    1101:	38 d8                	cmp    %bl,%al
    1103:	74 eb                	je     10f0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1105:	29 d8                	sub    %ebx,%eax
}
    1107:	5b                   	pop    %ebx
    1108:	5d                   	pop    %ebp
    1109:	c3                   	ret    
    110a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1110:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1112:	29 d8                	sub    %ebx,%eax
}
    1114:	5b                   	pop    %ebx
    1115:	5d                   	pop    %ebp
    1116:	c3                   	ret    
    1117:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    111e:	66 90                	xchg   %ax,%ax

00001120 <strlen>:

uint
strlen(char *s)
{
    1120:	f3 0f 1e fb          	endbr32 
    1124:	55                   	push   %ebp
    1125:	89 e5                	mov    %esp,%ebp
    1127:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    112a:	80 3a 00             	cmpb   $0x0,(%edx)
    112d:	74 21                	je     1150 <strlen+0x30>
    112f:	31 c0                	xor    %eax,%eax
    1131:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1138:	83 c0 01             	add    $0x1,%eax
    113b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    113f:	89 c1                	mov    %eax,%ecx
    1141:	75 f5                	jne    1138 <strlen+0x18>
    ;
  return n;
}
    1143:	89 c8                	mov    %ecx,%eax
    1145:	5d                   	pop    %ebp
    1146:	c3                   	ret    
    1147:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    114e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
    1150:	31 c9                	xor    %ecx,%ecx
}
    1152:	5d                   	pop    %ebp
    1153:	89 c8                	mov    %ecx,%eax
    1155:	c3                   	ret    
    1156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    115d:	8d 76 00             	lea    0x0(%esi),%esi

00001160 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1160:	f3 0f 1e fb          	endbr32 
    1164:	55                   	push   %ebp
    1165:	89 e5                	mov    %esp,%ebp
    1167:	57                   	push   %edi
    1168:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    116b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    116e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1171:	89 d7                	mov    %edx,%edi
    1173:	fc                   	cld    
    1174:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1176:	89 d0                	mov    %edx,%eax
    1178:	5f                   	pop    %edi
    1179:	5d                   	pop    %ebp
    117a:	c3                   	ret    
    117b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    117f:	90                   	nop

00001180 <strchr>:

char*
strchr(const char *s, char c)
{
    1180:	f3 0f 1e fb          	endbr32 
    1184:	55                   	push   %ebp
    1185:	89 e5                	mov    %esp,%ebp
    1187:	8b 45 08             	mov    0x8(%ebp),%eax
    118a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    118e:	0f b6 10             	movzbl (%eax),%edx
    1191:	84 d2                	test   %dl,%dl
    1193:	75 16                	jne    11ab <strchr+0x2b>
    1195:	eb 21                	jmp    11b8 <strchr+0x38>
    1197:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    119e:	66 90                	xchg   %ax,%ax
    11a0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    11a4:	83 c0 01             	add    $0x1,%eax
    11a7:	84 d2                	test   %dl,%dl
    11a9:	74 0d                	je     11b8 <strchr+0x38>
    if(*s == c)
    11ab:	38 d1                	cmp    %dl,%cl
    11ad:	75 f1                	jne    11a0 <strchr+0x20>
      return (char*)s;
  return 0;
}
    11af:	5d                   	pop    %ebp
    11b0:	c3                   	ret    
    11b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    11b8:	31 c0                	xor    %eax,%eax
}
    11ba:	5d                   	pop    %ebp
    11bb:	c3                   	ret    
    11bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011c0 <gets>:

char*
gets(char *buf, int max)
{
    11c0:	f3 0f 1e fb          	endbr32 
    11c4:	55                   	push   %ebp
    11c5:	89 e5                	mov    %esp,%ebp
    11c7:	57                   	push   %edi
    11c8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11c9:	31 f6                	xor    %esi,%esi
{
    11cb:	53                   	push   %ebx
    11cc:	89 f3                	mov    %esi,%ebx
    11ce:	83 ec 1c             	sub    $0x1c,%esp
    11d1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    11d4:	eb 33                	jmp    1209 <gets+0x49>
    11d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11dd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    11e0:	83 ec 04             	sub    $0x4,%esp
    11e3:	8d 45 e7             	lea    -0x19(%ebp),%eax
    11e6:	6a 01                	push   $0x1
    11e8:	50                   	push   %eax
    11e9:	6a 00                	push   $0x0
    11eb:	e8 2b 01 00 00       	call   131b <read>
    if(cc < 1)
    11f0:	83 c4 10             	add    $0x10,%esp
    11f3:	85 c0                	test   %eax,%eax
    11f5:	7e 1c                	jle    1213 <gets+0x53>
      break;
    buf[i++] = c;
    11f7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11fb:	83 c7 01             	add    $0x1,%edi
    11fe:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1201:	3c 0a                	cmp    $0xa,%al
    1203:	74 23                	je     1228 <gets+0x68>
    1205:	3c 0d                	cmp    $0xd,%al
    1207:	74 1f                	je     1228 <gets+0x68>
  for(i=0; i+1 < max; ){
    1209:	83 c3 01             	add    $0x1,%ebx
    120c:	89 fe                	mov    %edi,%esi
    120e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1211:	7c cd                	jl     11e0 <gets+0x20>
    1213:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    1215:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1218:	c6 03 00             	movb   $0x0,(%ebx)
}
    121b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    121e:	5b                   	pop    %ebx
    121f:	5e                   	pop    %esi
    1220:	5f                   	pop    %edi
    1221:	5d                   	pop    %ebp
    1222:	c3                   	ret    
    1223:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1227:	90                   	nop
    1228:	8b 75 08             	mov    0x8(%ebp),%esi
    122b:	8b 45 08             	mov    0x8(%ebp),%eax
    122e:	01 de                	add    %ebx,%esi
    1230:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    1232:	c6 03 00             	movb   $0x0,(%ebx)
}
    1235:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1238:	5b                   	pop    %ebx
    1239:	5e                   	pop    %esi
    123a:	5f                   	pop    %edi
    123b:	5d                   	pop    %ebp
    123c:	c3                   	ret    
    123d:	8d 76 00             	lea    0x0(%esi),%esi

00001240 <stat>:

int
stat(char *n, struct stat *st)
{
    1240:	f3 0f 1e fb          	endbr32 
    1244:	55                   	push   %ebp
    1245:	89 e5                	mov    %esp,%ebp
    1247:	56                   	push   %esi
    1248:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1249:	83 ec 08             	sub    $0x8,%esp
    124c:	6a 00                	push   $0x0
    124e:	ff 75 08             	pushl  0x8(%ebp)
    1251:	e8 ed 00 00 00       	call   1343 <open>
  if(fd < 0)
    1256:	83 c4 10             	add    $0x10,%esp
    1259:	85 c0                	test   %eax,%eax
    125b:	78 2b                	js     1288 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    125d:	83 ec 08             	sub    $0x8,%esp
    1260:	ff 75 0c             	pushl  0xc(%ebp)
    1263:	89 c3                	mov    %eax,%ebx
    1265:	50                   	push   %eax
    1266:	e8 f0 00 00 00       	call   135b <fstat>
  close(fd);
    126b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    126e:	89 c6                	mov    %eax,%esi
  close(fd);
    1270:	e8 b6 00 00 00       	call   132b <close>
  return r;
    1275:	83 c4 10             	add    $0x10,%esp
}
    1278:	8d 65 f8             	lea    -0x8(%ebp),%esp
    127b:	89 f0                	mov    %esi,%eax
    127d:	5b                   	pop    %ebx
    127e:	5e                   	pop    %esi
    127f:	5d                   	pop    %ebp
    1280:	c3                   	ret    
    1281:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1288:	be ff ff ff ff       	mov    $0xffffffff,%esi
    128d:	eb e9                	jmp    1278 <stat+0x38>
    128f:	90                   	nop

00001290 <atoi>:

int
atoi(const char *s)
{
    1290:	f3 0f 1e fb          	endbr32 
    1294:	55                   	push   %ebp
    1295:	89 e5                	mov    %esp,%ebp
    1297:	53                   	push   %ebx
    1298:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    129b:	0f be 02             	movsbl (%edx),%eax
    129e:	8d 48 d0             	lea    -0x30(%eax),%ecx
    12a1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    12a4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    12a9:	77 1a                	ja     12c5 <atoi+0x35>
    12ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12af:	90                   	nop
    n = n*10 + *s++ - '0';
    12b0:	83 c2 01             	add    $0x1,%edx
    12b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    12b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    12ba:	0f be 02             	movsbl (%edx),%eax
    12bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
    12c0:	80 fb 09             	cmp    $0x9,%bl
    12c3:	76 eb                	jbe    12b0 <atoi+0x20>
  return n;
}
    12c5:	89 c8                	mov    %ecx,%eax
    12c7:	5b                   	pop    %ebx
    12c8:	5d                   	pop    %ebp
    12c9:	c3                   	ret    
    12ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000012d0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    12d0:	f3 0f 1e fb          	endbr32 
    12d4:	55                   	push   %ebp
    12d5:	89 e5                	mov    %esp,%ebp
    12d7:	57                   	push   %edi
    12d8:	8b 45 10             	mov    0x10(%ebp),%eax
    12db:	8b 55 08             	mov    0x8(%ebp),%edx
    12de:	56                   	push   %esi
    12df:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12e2:	85 c0                	test   %eax,%eax
    12e4:	7e 0f                	jle    12f5 <memmove+0x25>
    12e6:	01 d0                	add    %edx,%eax
  dst = vdst;
    12e8:	89 d7                	mov    %edx,%edi
    12ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
    12f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    12f1:	39 f8                	cmp    %edi,%eax
    12f3:	75 fb                	jne    12f0 <memmove+0x20>
  return vdst;
}
    12f5:	5e                   	pop    %esi
    12f6:	89 d0                	mov    %edx,%eax
    12f8:	5f                   	pop    %edi
    12f9:	5d                   	pop    %ebp
    12fa:	c3                   	ret    

000012fb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12fb:	b8 01 00 00 00       	mov    $0x1,%eax
    1300:	cd 40                	int    $0x40
    1302:	c3                   	ret    

00001303 <exit>:
SYSCALL(exit)
    1303:	b8 02 00 00 00       	mov    $0x2,%eax
    1308:	cd 40                	int    $0x40
    130a:	c3                   	ret    

0000130b <wait>:
SYSCALL(wait)
    130b:	b8 03 00 00 00       	mov    $0x3,%eax
    1310:	cd 40                	int    $0x40
    1312:	c3                   	ret    

00001313 <pipe>:
SYSCALL(pipe)
    1313:	b8 04 00 00 00       	mov    $0x4,%eax
    1318:	cd 40                	int    $0x40
    131a:	c3                   	ret    

0000131b <read>:
SYSCALL(read)
    131b:	b8 05 00 00 00       	mov    $0x5,%eax
    1320:	cd 40                	int    $0x40
    1322:	c3                   	ret    

00001323 <write>:
SYSCALL(write)
    1323:	b8 10 00 00 00       	mov    $0x10,%eax
    1328:	cd 40                	int    $0x40
    132a:	c3                   	ret    

0000132b <close>:
SYSCALL(close)
    132b:	b8 15 00 00 00       	mov    $0x15,%eax
    1330:	cd 40                	int    $0x40
    1332:	c3                   	ret    

00001333 <kill>:
SYSCALL(kill)
    1333:	b8 06 00 00 00       	mov    $0x6,%eax
    1338:	cd 40                	int    $0x40
    133a:	c3                   	ret    

0000133b <exec>:
SYSCALL(exec)
    133b:	b8 07 00 00 00       	mov    $0x7,%eax
    1340:	cd 40                	int    $0x40
    1342:	c3                   	ret    

00001343 <open>:
SYSCALL(open)
    1343:	b8 0f 00 00 00       	mov    $0xf,%eax
    1348:	cd 40                	int    $0x40
    134a:	c3                   	ret    

0000134b <mknod>:
SYSCALL(mknod)
    134b:	b8 11 00 00 00       	mov    $0x11,%eax
    1350:	cd 40                	int    $0x40
    1352:	c3                   	ret    

00001353 <unlink>:
SYSCALL(unlink)
    1353:	b8 12 00 00 00       	mov    $0x12,%eax
    1358:	cd 40                	int    $0x40
    135a:	c3                   	ret    

0000135b <fstat>:
SYSCALL(fstat)
    135b:	b8 08 00 00 00       	mov    $0x8,%eax
    1360:	cd 40                	int    $0x40
    1362:	c3                   	ret    

00001363 <link>:
SYSCALL(link)
    1363:	b8 13 00 00 00       	mov    $0x13,%eax
    1368:	cd 40                	int    $0x40
    136a:	c3                   	ret    

0000136b <mkdir>:
SYSCALL(mkdir)
    136b:	b8 14 00 00 00       	mov    $0x14,%eax
    1370:	cd 40                	int    $0x40
    1372:	c3                   	ret    

00001373 <chdir>:
SYSCALL(chdir)
    1373:	b8 09 00 00 00       	mov    $0x9,%eax
    1378:	cd 40                	int    $0x40
    137a:	c3                   	ret    

0000137b <dup>:
SYSCALL(dup)
    137b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1380:	cd 40                	int    $0x40
    1382:	c3                   	ret    

00001383 <getpid>:
SYSCALL(getpid)
    1383:	b8 0b 00 00 00       	mov    $0xb,%eax
    1388:	cd 40                	int    $0x40
    138a:	c3                   	ret    

0000138b <sbrk>:
SYSCALL(sbrk)
    138b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1390:	cd 40                	int    $0x40
    1392:	c3                   	ret    

00001393 <sleep>:
SYSCALL(sleep)
    1393:	b8 0d 00 00 00       	mov    $0xd,%eax
    1398:	cd 40                	int    $0x40
    139a:	c3                   	ret    

0000139b <uptime>:
SYSCALL(uptime)
    139b:	b8 0e 00 00 00       	mov    $0xe,%eax
    13a0:	cd 40                	int    $0x40
    13a2:	c3                   	ret    

000013a3 <shm_open>:
SYSCALL(shm_open)
    13a3:	b8 16 00 00 00       	mov    $0x16,%eax
    13a8:	cd 40                	int    $0x40
    13aa:	c3                   	ret    

000013ab <shm_close>:
SYSCALL(shm_close)	
    13ab:	b8 17 00 00 00       	mov    $0x17,%eax
    13b0:	cd 40                	int    $0x40
    13b2:	c3                   	ret    
    13b3:	66 90                	xchg   %ax,%ax
    13b5:	66 90                	xchg   %ax,%ax
    13b7:	66 90                	xchg   %ax,%ax
    13b9:	66 90                	xchg   %ax,%ax
    13bb:	66 90                	xchg   %ax,%ax
    13bd:	66 90                	xchg   %ax,%ax
    13bf:	90                   	nop

000013c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    13c0:	55                   	push   %ebp
    13c1:	89 e5                	mov    %esp,%ebp
    13c3:	57                   	push   %edi
    13c4:	56                   	push   %esi
    13c5:	53                   	push   %ebx
    13c6:	83 ec 3c             	sub    $0x3c,%esp
    13c9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    13cc:	89 d1                	mov    %edx,%ecx
{
    13ce:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    13d1:	85 d2                	test   %edx,%edx
    13d3:	0f 89 7f 00 00 00    	jns    1458 <printint+0x98>
    13d9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    13dd:	74 79                	je     1458 <printint+0x98>
    neg = 1;
    13df:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    13e6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    13e8:	31 db                	xor    %ebx,%ebx
    13ea:	8d 75 d7             	lea    -0x29(%ebp),%esi
    13ed:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    13f0:	89 c8                	mov    %ecx,%eax
    13f2:	31 d2                	xor    %edx,%edx
    13f4:	89 cf                	mov    %ecx,%edi
    13f6:	f7 75 c4             	divl   -0x3c(%ebp)
    13f9:	0f b6 92 6c 18 00 00 	movzbl 0x186c(%edx),%edx
    1400:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1403:	89 d8                	mov    %ebx,%eax
    1405:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1408:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    140b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    140e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1411:	76 dd                	jbe    13f0 <printint+0x30>
  if(neg)
    1413:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1416:	85 c9                	test   %ecx,%ecx
    1418:	74 0c                	je     1426 <printint+0x66>
    buf[i++] = '-';
    141a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    141f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1421:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1426:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1429:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    142d:	eb 07                	jmp    1436 <printint+0x76>
    142f:	90                   	nop
    1430:	0f b6 13             	movzbl (%ebx),%edx
    1433:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1436:	83 ec 04             	sub    $0x4,%esp
    1439:	88 55 d7             	mov    %dl,-0x29(%ebp)
    143c:	6a 01                	push   $0x1
    143e:	56                   	push   %esi
    143f:	57                   	push   %edi
    1440:	e8 de fe ff ff       	call   1323 <write>
  while(--i >= 0)
    1445:	83 c4 10             	add    $0x10,%esp
    1448:	39 de                	cmp    %ebx,%esi
    144a:	75 e4                	jne    1430 <printint+0x70>
    putc(fd, buf[i]);
}
    144c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    144f:	5b                   	pop    %ebx
    1450:	5e                   	pop    %esi
    1451:	5f                   	pop    %edi
    1452:	5d                   	pop    %ebp
    1453:	c3                   	ret    
    1454:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1458:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    145f:	eb 87                	jmp    13e8 <printint+0x28>
    1461:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1468:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    146f:	90                   	nop

00001470 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1470:	f3 0f 1e fb          	endbr32 
    1474:	55                   	push   %ebp
    1475:	89 e5                	mov    %esp,%ebp
    1477:	57                   	push   %edi
    1478:	56                   	push   %esi
    1479:	53                   	push   %ebx
    147a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    147d:	8b 75 0c             	mov    0xc(%ebp),%esi
    1480:	0f b6 1e             	movzbl (%esi),%ebx
    1483:	84 db                	test   %bl,%bl
    1485:	0f 84 b4 00 00 00    	je     153f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    148b:	8d 45 10             	lea    0x10(%ebp),%eax
    148e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1491:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1494:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    1496:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1499:	eb 33                	jmp    14ce <printf+0x5e>
    149b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    149f:	90                   	nop
    14a0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    14a3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    14a8:	83 f8 25             	cmp    $0x25,%eax
    14ab:	74 17                	je     14c4 <printf+0x54>
  write(fd, &c, 1);
    14ad:	83 ec 04             	sub    $0x4,%esp
    14b0:	88 5d e7             	mov    %bl,-0x19(%ebp)
    14b3:	6a 01                	push   $0x1
    14b5:	57                   	push   %edi
    14b6:	ff 75 08             	pushl  0x8(%ebp)
    14b9:	e8 65 fe ff ff       	call   1323 <write>
    14be:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    14c1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    14c4:	0f b6 1e             	movzbl (%esi),%ebx
    14c7:	83 c6 01             	add    $0x1,%esi
    14ca:	84 db                	test   %bl,%bl
    14cc:	74 71                	je     153f <printf+0xcf>
    c = fmt[i] & 0xff;
    14ce:	0f be cb             	movsbl %bl,%ecx
    14d1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    14d4:	85 d2                	test   %edx,%edx
    14d6:	74 c8                	je     14a0 <printf+0x30>
      }
    } else if(state == '%'){
    14d8:	83 fa 25             	cmp    $0x25,%edx
    14db:	75 e7                	jne    14c4 <printf+0x54>
      if(c == 'd'){
    14dd:	83 f8 64             	cmp    $0x64,%eax
    14e0:	0f 84 9a 00 00 00    	je     1580 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    14e6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    14ec:	83 f9 70             	cmp    $0x70,%ecx
    14ef:	74 5f                	je     1550 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    14f1:	83 f8 73             	cmp    $0x73,%eax
    14f4:	0f 84 d6 00 00 00    	je     15d0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    14fa:	83 f8 63             	cmp    $0x63,%eax
    14fd:	0f 84 8d 00 00 00    	je     1590 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1503:	83 f8 25             	cmp    $0x25,%eax
    1506:	0f 84 b4 00 00 00    	je     15c0 <printf+0x150>
  write(fd, &c, 1);
    150c:	83 ec 04             	sub    $0x4,%esp
    150f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1513:	6a 01                	push   $0x1
    1515:	57                   	push   %edi
    1516:	ff 75 08             	pushl  0x8(%ebp)
    1519:	e8 05 fe ff ff       	call   1323 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    151e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1521:	83 c4 0c             	add    $0xc,%esp
    1524:	6a 01                	push   $0x1
    1526:	83 c6 01             	add    $0x1,%esi
    1529:	57                   	push   %edi
    152a:	ff 75 08             	pushl  0x8(%ebp)
    152d:	e8 f1 fd ff ff       	call   1323 <write>
  for(i = 0; fmt[i]; i++){
    1532:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    1536:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    1539:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    153b:	84 db                	test   %bl,%bl
    153d:	75 8f                	jne    14ce <printf+0x5e>
    }
  }
}
    153f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1542:	5b                   	pop    %ebx
    1543:	5e                   	pop    %esi
    1544:	5f                   	pop    %edi
    1545:	5d                   	pop    %ebp
    1546:	c3                   	ret    
    1547:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    154e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1550:	83 ec 0c             	sub    $0xc,%esp
    1553:	b9 10 00 00 00       	mov    $0x10,%ecx
    1558:	6a 00                	push   $0x0
    155a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    155d:	8b 45 08             	mov    0x8(%ebp),%eax
    1560:	8b 13                	mov    (%ebx),%edx
    1562:	e8 59 fe ff ff       	call   13c0 <printint>
        ap++;
    1567:	89 d8                	mov    %ebx,%eax
    1569:	83 c4 10             	add    $0x10,%esp
      state = 0;
    156c:	31 d2                	xor    %edx,%edx
        ap++;
    156e:	83 c0 04             	add    $0x4,%eax
    1571:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1574:	e9 4b ff ff ff       	jmp    14c4 <printf+0x54>
    1579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    1580:	83 ec 0c             	sub    $0xc,%esp
    1583:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1588:	6a 01                	push   $0x1
    158a:	eb ce                	jmp    155a <printf+0xea>
    158c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1590:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    1593:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1596:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    1598:	6a 01                	push   $0x1
        ap++;
    159a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    159d:	57                   	push   %edi
    159e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    15a1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    15a4:	e8 7a fd ff ff       	call   1323 <write>
        ap++;
    15a9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    15ac:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15af:	31 d2                	xor    %edx,%edx
    15b1:	e9 0e ff ff ff       	jmp    14c4 <printf+0x54>
    15b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15bd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    15c0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    15c3:	83 ec 04             	sub    $0x4,%esp
    15c6:	e9 59 ff ff ff       	jmp    1524 <printf+0xb4>
    15cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15cf:	90                   	nop
        s = (char*)*ap;
    15d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15d3:	8b 18                	mov    (%eax),%ebx
        ap++;
    15d5:	83 c0 04             	add    $0x4,%eax
    15d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    15db:	85 db                	test   %ebx,%ebx
    15dd:	74 17                	je     15f6 <printf+0x186>
        while(*s != 0){
    15df:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    15e2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    15e4:	84 c0                	test   %al,%al
    15e6:	0f 84 d8 fe ff ff    	je     14c4 <printf+0x54>
    15ec:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    15ef:	89 de                	mov    %ebx,%esi
    15f1:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15f4:	eb 1a                	jmp    1610 <printf+0x1a0>
          s = "(null)";
    15f6:	bb 64 18 00 00       	mov    $0x1864,%ebx
        while(*s != 0){
    15fb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    15fe:	b8 28 00 00 00       	mov    $0x28,%eax
    1603:	89 de                	mov    %ebx,%esi
    1605:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1608:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    160f:	90                   	nop
  write(fd, &c, 1);
    1610:	83 ec 04             	sub    $0x4,%esp
          s++;
    1613:	83 c6 01             	add    $0x1,%esi
    1616:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1619:	6a 01                	push   $0x1
    161b:	57                   	push   %edi
    161c:	53                   	push   %ebx
    161d:	e8 01 fd ff ff       	call   1323 <write>
        while(*s != 0){
    1622:	0f b6 06             	movzbl (%esi),%eax
    1625:	83 c4 10             	add    $0x10,%esp
    1628:	84 c0                	test   %al,%al
    162a:	75 e4                	jne    1610 <printf+0x1a0>
    162c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    162f:	31 d2                	xor    %edx,%edx
    1631:	e9 8e fe ff ff       	jmp    14c4 <printf+0x54>
    1636:	66 90                	xchg   %ax,%ax
    1638:	66 90                	xchg   %ax,%ax
    163a:	66 90                	xchg   %ax,%ax
    163c:	66 90                	xchg   %ax,%ax
    163e:	66 90                	xchg   %ax,%ax

00001640 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1640:	f3 0f 1e fb          	endbr32 
    1644:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1645:	a1 78 1b 00 00       	mov    0x1b78,%eax
{
    164a:	89 e5                	mov    %esp,%ebp
    164c:	57                   	push   %edi
    164d:	56                   	push   %esi
    164e:	53                   	push   %ebx
    164f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1652:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    1654:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1657:	39 c8                	cmp    %ecx,%eax
    1659:	73 15                	jae    1670 <free+0x30>
    165b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    165f:	90                   	nop
    1660:	39 d1                	cmp    %edx,%ecx
    1662:	72 14                	jb     1678 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1664:	39 d0                	cmp    %edx,%eax
    1666:	73 10                	jae    1678 <free+0x38>
{
    1668:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    166a:	8b 10                	mov    (%eax),%edx
    166c:	39 c8                	cmp    %ecx,%eax
    166e:	72 f0                	jb     1660 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1670:	39 d0                	cmp    %edx,%eax
    1672:	72 f4                	jb     1668 <free+0x28>
    1674:	39 d1                	cmp    %edx,%ecx
    1676:	73 f0                	jae    1668 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1678:	8b 73 fc             	mov    -0x4(%ebx),%esi
    167b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    167e:	39 fa                	cmp    %edi,%edx
    1680:	74 1e                	je     16a0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1682:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1685:	8b 50 04             	mov    0x4(%eax),%edx
    1688:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    168b:	39 f1                	cmp    %esi,%ecx
    168d:	74 28                	je     16b7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    168f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    1691:	5b                   	pop    %ebx
  freep = p;
    1692:	a3 78 1b 00 00       	mov    %eax,0x1b78
}
    1697:	5e                   	pop    %esi
    1698:	5f                   	pop    %edi
    1699:	5d                   	pop    %ebp
    169a:	c3                   	ret    
    169b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    169f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    16a0:	03 72 04             	add    0x4(%edx),%esi
    16a3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16a6:	8b 10                	mov    (%eax),%edx
    16a8:	8b 12                	mov    (%edx),%edx
    16aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16ad:	8b 50 04             	mov    0x4(%eax),%edx
    16b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16b3:	39 f1                	cmp    %esi,%ecx
    16b5:	75 d8                	jne    168f <free+0x4f>
    p->s.size += bp->s.size;
    16b7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    16ba:	a3 78 1b 00 00       	mov    %eax,0x1b78
    p->s.size += bp->s.size;
    16bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16c2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    16c5:	89 10                	mov    %edx,(%eax)
}
    16c7:	5b                   	pop    %ebx
    16c8:	5e                   	pop    %esi
    16c9:	5f                   	pop    %edi
    16ca:	5d                   	pop    %ebp
    16cb:	c3                   	ret    
    16cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000016d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16d0:	f3 0f 1e fb          	endbr32 
    16d4:	55                   	push   %ebp
    16d5:	89 e5                	mov    %esp,%ebp
    16d7:	57                   	push   %edi
    16d8:	56                   	push   %esi
    16d9:	53                   	push   %ebx
    16da:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16dd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16e0:	8b 3d 78 1b 00 00    	mov    0x1b78,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16e6:	8d 70 07             	lea    0x7(%eax),%esi
    16e9:	c1 ee 03             	shr    $0x3,%esi
    16ec:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    16ef:	85 ff                	test   %edi,%edi
    16f1:	0f 84 a9 00 00 00    	je     17a0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16f7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    16f9:	8b 48 04             	mov    0x4(%eax),%ecx
    16fc:	39 f1                	cmp    %esi,%ecx
    16fe:	73 6d                	jae    176d <malloc+0x9d>
    1700:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    1706:	bb 00 10 00 00       	mov    $0x1000,%ebx
    170b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    170e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    1715:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    1718:	eb 17                	jmp    1731 <malloc+0x61>
    171a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1720:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1722:	8b 4a 04             	mov    0x4(%edx),%ecx
    1725:	39 f1                	cmp    %esi,%ecx
    1727:	73 4f                	jae    1778 <malloc+0xa8>
    1729:	8b 3d 78 1b 00 00    	mov    0x1b78,%edi
    172f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1731:	39 c7                	cmp    %eax,%edi
    1733:	75 eb                	jne    1720 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    1735:	83 ec 0c             	sub    $0xc,%esp
    1738:	ff 75 e4             	pushl  -0x1c(%ebp)
    173b:	e8 4b fc ff ff       	call   138b <sbrk>
  if(p == (char*)-1)
    1740:	83 c4 10             	add    $0x10,%esp
    1743:	83 f8 ff             	cmp    $0xffffffff,%eax
    1746:	74 1b                	je     1763 <malloc+0x93>
  hp->s.size = nu;
    1748:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    174b:	83 ec 0c             	sub    $0xc,%esp
    174e:	83 c0 08             	add    $0x8,%eax
    1751:	50                   	push   %eax
    1752:	e8 e9 fe ff ff       	call   1640 <free>
  return freep;
    1757:	a1 78 1b 00 00       	mov    0x1b78,%eax
      if((p = morecore(nunits)) == 0)
    175c:	83 c4 10             	add    $0x10,%esp
    175f:	85 c0                	test   %eax,%eax
    1761:	75 bd                	jne    1720 <malloc+0x50>
        return 0;
  }
}
    1763:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1766:	31 c0                	xor    %eax,%eax
}
    1768:	5b                   	pop    %ebx
    1769:	5e                   	pop    %esi
    176a:	5f                   	pop    %edi
    176b:	5d                   	pop    %ebp
    176c:	c3                   	ret    
    if(p->s.size >= nunits){
    176d:	89 c2                	mov    %eax,%edx
    176f:	89 f8                	mov    %edi,%eax
    1771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1778:	39 ce                	cmp    %ecx,%esi
    177a:	74 54                	je     17d0 <malloc+0x100>
        p->s.size -= nunits;
    177c:	29 f1                	sub    %esi,%ecx
    177e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    1781:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    1784:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    1787:	a3 78 1b 00 00       	mov    %eax,0x1b78
}
    178c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    178f:	8d 42 08             	lea    0x8(%edx),%eax
}
    1792:	5b                   	pop    %ebx
    1793:	5e                   	pop    %esi
    1794:	5f                   	pop    %edi
    1795:	5d                   	pop    %ebp
    1796:	c3                   	ret    
    1797:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    179e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    17a0:	c7 05 78 1b 00 00 7c 	movl   $0x1b7c,0x1b78
    17a7:	1b 00 00 
    base.s.size = 0;
    17aa:	bf 7c 1b 00 00       	mov    $0x1b7c,%edi
    base.s.ptr = freep = prevp = &base;
    17af:	c7 05 7c 1b 00 00 7c 	movl   $0x1b7c,0x1b7c
    17b6:	1b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17b9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    17bb:	c7 05 80 1b 00 00 00 	movl   $0x0,0x1b80
    17c2:	00 00 00 
    if(p->s.size >= nunits){
    17c5:	e9 36 ff ff ff       	jmp    1700 <malloc+0x30>
    17ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    17d0:	8b 0a                	mov    (%edx),%ecx
    17d2:	89 08                	mov    %ecx,(%eax)
    17d4:	eb b1                	jmp    1787 <malloc+0xb7>
    17d6:	66 90                	xchg   %ax,%ax
    17d8:	66 90                	xchg   %ax,%ax
    17da:	66 90                	xchg   %ax,%ax
    17dc:	66 90                	xchg   %ax,%ax
    17de:	66 90                	xchg   %ax,%ax

000017e0 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    17e0:	f3 0f 1e fb          	endbr32 
    17e4:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    17e5:	b9 01 00 00 00       	mov    $0x1,%ecx
    17ea:	89 e5                	mov    %esp,%ebp
    17ec:	8b 55 08             	mov    0x8(%ebp),%edx
    17ef:	90                   	nop
    17f0:	89 c8                	mov    %ecx,%eax
    17f2:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    17f5:	85 c0                	test   %eax,%eax
    17f7:	75 f7                	jne    17f0 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    17f9:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    17fe:	5d                   	pop    %ebp
    17ff:	c3                   	ret    

00001800 <urelease>:

void urelease (struct uspinlock *lk) {
    1800:	f3 0f 1e fb          	endbr32 
    1804:	55                   	push   %ebp
    1805:	89 e5                	mov    %esp,%ebp
    1807:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    180a:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    180f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1815:	5d                   	pop    %ebp
    1816:	c3                   	ret    
