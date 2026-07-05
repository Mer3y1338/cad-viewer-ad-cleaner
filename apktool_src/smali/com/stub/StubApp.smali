.class public final Lcom/stub/StubApp;
.super Landroid/app/Application;
.source "SourceFile"


# static fields
.field private static a:Landroid/app/Application;

.field private static b:Landroid/app/Application;

.field private static c:Ljava/lang/String;

.field private static d:Landroid/content/Context;

.field private static e:Ljava/lang/String;

.field private static f:Ljava/lang/String;

.field private static g:Ljava/lang/String;

.field private static h:Ljava/lang/String;

.field private static i:Ljava/lang/String;

.field private static j:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static loadFromLib:Z

.field private static needX86Bridge:Z

.field private static perm:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private static returnIntern:Z

.field public static strEntryApplication:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 43
    sput-object v1, Lcom/stub/StubApp;->a:Landroid/app/Application;

    .line 44
    const-string v0, "entryRunApplication"

    sput-object v0, Lcom/stub/StubApp;->strEntryApplication:Ljava/lang/String;

    .line 45
    sput-object v1, Lcom/stub/StubApp;->b:Landroid/app/Application;

    .line 46
    const-string v0, "libjiagu"

    sput-object v0, Lcom/stub/StubApp;->c:Ljava/lang/String;

    .line 47
    const/4 v2, 0x0

    sput-boolean v2, Lcom/stub/StubApp;->loadFromLib:Z

    .line 48
    const/4 v2, 0x0

    sput-boolean v2, Lcom/stub/StubApp;->needX86Bridge:Z

    .line 49
    const/4 v0, 0x1

    const/4 v0, 0x1

    sput-boolean v0, Lcom/stub/StubApp;->returnIntern:Z

    .line 53
    sput-object v1, Lcom/stub/StubApp;->e:Ljava/lang/String;

    .line 54
    sput-object v1, Lcom/stub/StubApp;->f:Ljava/lang/String;

    .line 55
    sput-object v1, Lcom/stub/StubApp;->g:Ljava/lang/String;

    .line 56
    sput-object v1, Lcom/stub/StubApp;->h:Ljava/lang/String;

    .line 57
    sput-object v1, Lcom/stub/StubApp;->i:Ljava/lang/String;

    .line 58
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/stub/StubApp;->j:Ljava/util/Map;

    .line 59
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/stub/StubApp;->perm:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method public static ChangeTopApplication()V
    .locals 2

    .prologue
    .line 118
    sget-object v0, Lcom/stub/StubApp;->a:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    .line 120
    :try_start_0
    sget-object v1, Lcom/stub/StubApp;->b:Landroid/app/Application;

    invoke-static {v1, v0}, Lcom/stub/StubApp;->interface7(Landroid/app/Application;Landroid/content/Context;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private static a(Landroid/content/Context;)Landroid/app/Application;
    .locals 2

    .prologue
    .line 96
    :try_start_0
    sget-object v0, Lcom/stub/StubApp;->b:Landroid/app/Application;

    if-nez v0, :cond_0

    .line 97
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 98
    if-eqz v0, :cond_0

    .line 99
    sget-object v1, Lcom/stub/StubApp;->strEntryApplication:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 100
    if-eqz v0, :cond_0

    .line 101
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Application;

    sput-object v0, Lcom/stub/StubApp;->b:Landroid/app/Application;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    :cond_0
    :goto_0
    sget-object v0, Lcom/stub/StubApp;->b:Landroid/app/Application;

    return-object v0

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private static a(Ljava/lang/String;ZZ)Ljava/lang/String;
    .locals 3

    .prologue
    .line 231
    sget-object v0, Lcom/stub/StubApp;->c:Ljava/lang/String;

    .line 232
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-ge v1, v2, :cond_0

    .line 233
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    .line 234
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 236
    :cond_0
    if-eqz p1, :cond_1

    if-nez p2, :cond_1

    .line 237
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_64.so"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 242
    :goto_0
    return-object v0

    .line 239
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".so"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static native fcmark()V
.end method

.method public static getAppContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 76
    sget-object v0, Lcom/stub/StubApp;->d:Landroid/content/Context;

    return-object v0
.end method

.method public static getDir()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    sget-object v0, Lcom/stub/StubApp;->h:Ljava/lang/String;

    return-object v0
.end method

.method public static getOrigApplicationContext(Landroid/content/Context;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 80
    sget-object v0, Lcom/stub/StubApp;->a:Landroid/app/Application;

    if-ne p0, v0, :cond_0

    .line 81
    sget-object p0, Lcom/stub/StubApp;->b:Landroid/app/Application;

    .line 83
    :cond_0
    return-object p0
.end method

.method public static getSoPath1()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    sget-object v0, Lcom/stub/StubApp;->f:Ljava/lang/String;

    return-object v0
.end method

.method public static getSoPath2()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    sget-object v0, Lcom/stub/StubApp;->g:Ljava/lang/String;

    return-object v0
.end method

.method public static getString2(I)Ljava/lang/String;
    .locals 3

    .prologue
    .line 301
    sget-object v0, Lcom/stub/StubApp;->j:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 302
    if-nez v0, :cond_0

    .line 303
    invoke-static {p0}, Lcom/stub/StubApp;->interface14(I)Ljava/lang/String;

    move-result-object v0

    .line 304
    sget-object v1, Lcom/stub/StubApp;->j:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    :cond_0
    if-eqz v0, :cond_1

    sget-boolean v1, Lcom/stub/StubApp;->returnIntern:Z

    if-eqz v1, :cond_1

    .line 307
    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    .line 309
    :cond_1
    return-object v0
.end method

.method public static getString2(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 314
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 315
    invoke-static {v0}, Lcom/stub/StubApp;->getString2(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 319
    :goto_0
    return-object v0

    .line 316
    :catch_0
    move-exception v0

    .line 317
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 319
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static native interface11(I)V
.end method

.method public static native interface12(Ldalvik/system/DexFile;)Ljava/util/Enumeration;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ldalvik/system/DexFile;",
            ")",
            "Ljava/util/Enumeration",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public static native interface13(IJJJIIJ)J
.end method

.method public static native interface14(I)Ljava/lang/String;
.end method

.method public static native interface17(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;
.end method

.method public static native interface18(Ljava/lang/Class;Ljava/lang/String;)Ljava/io/InputStream;
.end method

.method public static native interface19(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/io/InputStream;
.end method

.method public static native interface199(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/io/InputStream;
.end method

.method public static native interface20()V
.end method

.method public static native interface21(Landroid/app/Application;)V
.end method

.method public static native interface22(I[Ljava/lang/String;[I)V
.end method

.method public static native interface24(Landroid/app/Activity;[Ljava/lang/String;I)V
.end method

.method public static native interface30(Ljava/util/zip/ZipFile;Ljava/lang/String;)Ljava/util/zip/ZipEntry;
.end method

.method public static native interface5(Landroid/app/Application;)V
.end method

.method public static native interface51(Landroid/content/res/Resources;I)Ljava/io/InputStream;
.end method

.method public static native interface52(Landroid/content/res/Resources;ILandroid/util/TypedValue;)Ljava/io/InputStream;
.end method

.method public static native interface53(Landroid/content/res/Resources;I)Landroid/content/res/AssetFileDescriptor;
.end method

.method public static native interface54(Landroid/content/Context;I)Landroid/media/MediaPlayer;
.end method

.method public static native interface55(Landroid/content/Context;ILandroid/media/AudioAttributes;I)Landroid/media/MediaPlayer;
.end method

.method public static native interface56(Landroid/media/SoundPool;Landroid/content/Context;II)I
.end method

.method public static native interface6(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native interface7(Landroid/app/Application;Landroid/content/Context;)Z
.end method

.method public static native interface8(Landroid/app/Application;Landroid/content/Context;)Z
.end method

.method public static isX86Arch()Z
    .locals 1

    .prologue
    .line 323
    invoke-static {}, Lcom/tianyu/util/a;->a()Z

    move-result v0

    return v0
.end method

.method public static native mark(Landroid/location/LocationManager;Ljava/lang/String;)Landroid/location/Location;
.end method

.method public static native mark()V
.end method

.method public static native mark(Landroid/location/Location;)V
.end method

.method public static synchronized native n0013()Ljava/lang/Object;
.end method

.method public static native n0110()V
.end method

.method public static native n0111()I
.end method

.method public static native n01110(Z)V
.end method

.method public static native n01111(I)I
.end method

.method public static native n011110(II)V
.end method

.method public static native n011111(IZ)Z
.end method

.method public static native n0111110(III)V
.end method

.method public static native n01111110(IIII)V
.end method

.method public static native n011111111310(IIIIZZLjava/lang/Object;Z)V
.end method

.method public static native n011111111311113131310(IIIIIILjava/lang/Object;IIIILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;I)V
.end method

.method public static native n01111111131113131310(IIIIIILjava/lang/Object;IIILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;I)V
.end method

.method public static native n0111111113113131310(IIIIIILjava/lang/Object;IILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;I)V
.end method

.method public static native n0111111131120(ZIZIILjava/lang/Object;IIJ)V
.end method

.method public static native n01111120(IIIJ)V
.end method

.method public static native n0111113(ZZZ)Ljava/lang/Object;
.end method

.method public static native n011112333(IIJLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native n0111130(IILjava/lang/Object;)V
.end method

.method public static native n0111131(IILjava/lang/Object;)B
.end method

.method public static native n0111132(IILjava/lang/Object;)D
.end method

.method public static native n0111133(IILjava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native n011120(ZD)V
.end method

.method public static native n011122(IJ)J
.end method

.method public static native n0111220(IDD)V
.end method

.method public static native n011122330(IJJLjava/lang/Object;Ljava/lang/Object;)V
.end method

.method public static native n0111233(IJLjava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native n01112332(IJLjava/lang/Object;Ljava/lang/Object;)J
.end method

.method public static native n01113(I)Ljava/lang/Object;
.end method

.method public static native n011131(ILjava/lang/Object;)I
.end method

.method public static native n0111311(ILjava/lang/Object;I)Z
.end method

.method public static native n011131131(ILjava/lang/Object;IILjava/lang/Object;)I
.end method

.method public static native n011133(ILjava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native n0111330(ILjava/lang/Object;Ljava/lang/Object;)V
.end method

.method public static native n0111331(ILjava/lang/Object;Ljava/lang/Object;)I
.end method

.method public static native n011133130(ILjava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;)V
.end method

.method public static native n011133320(ILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;J)V
.end method

.method public static native n01113333(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native n01113333333333(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native n01113333333333111(ILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZZ)I
.end method

.method public static native n0112()J
.end method

.method public static native n01120(J)V
.end method

.method public static native n01121(J)I
.end method

.method public static native n011210(JI)V
.end method

.method public static native n011211(JI)I
.end method

.method public static native n0112110(JII)V
.end method

.method public static native n0112111(JIF)F
.end method

.method public static native n01121110(JIII)V
.end method

.method public static native n011211110(JIFFF)V
.end method

.method public static native n01121111230(JIIIIJLjava/lang/Object;)V
.end method

.method public static native n01121111231(JIIIIJLjava/lang/Object;)I
.end method

.method public static native n01121112(JIII)J
.end method

.method public static native n01121113(DIII)Ljava/lang/Object;
.end method

.method public static native n011211130(JZZZLjava/lang/Object;)V
.end method

.method public static native n0112113(DII)Ljava/lang/Object;
.end method

.method public static native n011211330(JFFLjava/lang/Object;Ljava/lang/Object;)V
.end method

.method public static native n0112113330(JIILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
.end method

.method public static native n011212(JI)J
.end method

.method public static native n0112120(JIJ)V
.end method

.method public static native n0112121(JID)I
.end method

.method public static native n0112122(JID)D
.end method

.method public static native n011212230(JIJJLjava/lang/Object;)V
.end method

.method public static native n011213(JI)Ljava/lang/Object;
.end method

.method public static native n0112130(JILjava/lang/Object;)V
.end method

.method public static native n0112131(JILjava/lang/Object;)I
.end method

.method public static native n01121312(JILjava/lang/Object;I)J
.end method

.method public static native n011213131310(JILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;I)V
.end method

.method public static native n0112132(JILjava/lang/Object;)J
.end method

.method public static native n01121320(JILjava/lang/Object;J)V
.end method

.method public static native n01122(J)J
.end method

.method public static native n011220(JJ)V
.end method

.method public static native n011221(JJ)I
.end method

.method public static native n0112210(JJI)V
.end method

.method public static native n01122112121111111212122(JJIIJIJIFIFIFIDIDID)J
.end method

.method public static native n011221121212122(JJIIJIJIJIJ)J
.end method

.method public static native n0112211313131312121211111111122(JJIILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;IJIJIJIIIIIIIFID)J
.end method

.method public static native n011221131313131313132(JJIILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;)J
.end method

.method public static native n011221131313132(JJIILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;)J
.end method

.method public static native n011221132(JJIILjava/lang/Object;)J
.end method

.method public static native n011222(JJ)J
.end method

.method public static native n01122212(DDDI)D
.end method

.method public static native n011223(JJ)Ljava/lang/Object;
.end method

.method public static native n0112230(JJLjava/lang/Object;)V
.end method

.method public static native n01123(D)Ljava/lang/Object;
.end method

.method public static native n011230(JLjava/lang/Object;)V
.end method

.method public static native n011231(JLjava/lang/Object;)I
.end method

.method public static native n0112310(JLjava/lang/Object;I)V
.end method

.method public static native n0112311(JLjava/lang/Object;I)I
.end method

.method public static native n01123110(JLjava/lang/Object;II)V
.end method

.method public static native n01123111(JLjava/lang/Object;II)Z
.end method

.method public static native n011231111(JLjava/lang/Object;III)I
.end method

.method public static native n0112311111(JLjava/lang/Object;IIII)I
.end method

.method public static native n01123111111(JLjava/lang/Object;IIIIS)I
.end method

.method public static native n0112311113(JLjava/lang/Object;IIII)Ljava/lang/Object;
.end method

.method public static native n011231121113110(JLjava/lang/Object;IIJIIZLjava/lang/Object;IZ)V
.end method

.method public static native n0112312(JLjava/lang/Object;I)J
.end method

.method public static native n0112313(JLjava/lang/Object;I)Ljava/lang/Object;
.end method

.method public static native n0112313130(JLjava/lang/Object;ILjava/lang/Object;ZLjava/lang/Object;)V
.end method

.method public static native n011231330(JLjava/lang/Object;ILjava/lang/Object;Ljava/lang/Object;)V
.end method

.method public static native n011232(JLjava/lang/Object;)J
.end method

.method public static native n0112321111(JLjava/lang/Object;JIII)I
.end method

.method public static native n01123211111(JLjava/lang/Object;JZIII)I
.end method

.method public static native n0112322(JLjava/lang/Object;J)J
.end method

.method public static native n011233(JLjava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native n0112330(JLjava/lang/Object;Ljava/lang/Object;)V
.end method

.method public static native n0112331(JLjava/lang/Object;Ljava/lang/Object;)I
.end method

.method public static native n011233110(JLjava/lang/Object;Ljava/lang/Object;II)V
.end method

.method public static native n01123312(JLjava/lang/Object;Ljava/lang/Object;I)J
.end method

.method public static native n01123313(JLjava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;
.end method

.method public static native n0112332(JLjava/lang/Object;Ljava/lang/Object;)J
.end method

.method public static native n01123322(JLjava/lang/Object;Ljava/lang/Object;J)J
.end method

.method public static native n011233230(JLjava/lang/Object;Ljava/lang/Object;JLjava/lang/Object;)V
.end method

.method public static native n0112332310(JLjava/lang/Object;Ljava/lang/Object;JLjava/lang/Object;I)V
.end method

.method public static native n011233232(JLjava/lang/Object;Ljava/lang/Object;JLjava/lang/Object;)J
.end method

.method public static native n011233233(JLjava/lang/Object;Ljava/lang/Object;JLjava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native n01123330(JLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
.end method

.method public static native n01123332(JLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)J
.end method

.method public static native n011233330(JLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
.end method

.method public static native n011233333330(JLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
.end method

.method public static native n0113()Ljava/lang/Object;
.end method

.method public static native n01130(Ljava/lang/Object;)V
.end method

.method public static native n01131(Ljava/lang/Object;)Z
.end method

.method public static native n011310(Ljava/lang/Object;I)V
.end method

.method public static native n011311(Ljava/lang/Object;I)I
.end method

.method public static native n0113111(Ljava/lang/Object;II)I
.end method

.method public static native n01131110(Ljava/lang/Object;III)V
.end method

.method public static native n01131112(Ljava/lang/Object;III)J
.end method

.method public static native n01131113(Ljava/lang/Object;ZZZ)Ljava/lang/Object;
.end method

.method public static native n0113112(Ljava/lang/Object;II)J
.end method

.method public static native n0113113(Ljava/lang/Object;II)Ljava/lang/Object;
.end method

.method public static native n011312(Ljava/lang/Object;I)J
.end method

.method public static native n01131211(Ljava/lang/Object;IJI)I
.end method

.method public static native n011313(Ljava/lang/Object;I)Ljava/lang/Object;
.end method

.method public static native n0113130(Ljava/lang/Object;ILjava/lang/Object;)V
.end method

.method public static native n0113131110(Ljava/lang/Object;ILjava/lang/Object;III)V
.end method

.method public static native n01131313111111111(Ljava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;IIIIIIII)I
.end method

.method public static native n0113131311111313131110(Ljava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;IIIIILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;III)V
.end method

.method public static native n0113131311131111(Ljava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;IIILjava/lang/Object;III)I
.end method

.method public static native n01131313111331111111(Ljava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;IIILjava/lang/Object;Ljava/lang/Object;IIIIII)I
.end method

.method public static native n01131313113113113113331111(Ljava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;IILjava/lang/Object;IILjava/lang/Object;IILjava/lang/Object;IILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;III)I
.end method

.method public static native n0113131313131110(Ljava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;III)V
.end method

.method public static native n011313131313131110(Ljava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;III)V
.end method

.method public static native n0113131313131311110(Ljava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;IIII)V
.end method

.method public static native n0113133(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native n01131333313(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;
.end method

.method public static native n01132(Ljava/lang/Object;)D
.end method

.method public static native n011320(Ljava/lang/Object;D)V
.end method

.method public static native n0113210(Ljava/lang/Object;DZ)V
.end method

.method public static native n01132113(Ljava/lang/Object;JIZ)Ljava/lang/Object;
.end method

.method public static native n01132220(Ljava/lang/Object;DDD)V
.end method

.method public static native n011323(Ljava/lang/Object;J)Ljava/lang/Object;
.end method

.method public static native n0113233(Ljava/lang/Object;JLjava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native n01133(Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native n011330(Ljava/lang/Object;Ljava/lang/Object;)V
.end method

.method public static native n011331(Ljava/lang/Object;Ljava/lang/Object;)I
.end method

.method public static native n0113310(Ljava/lang/Object;Ljava/lang/Object;I)V
.end method

.method public static native n0113311(Ljava/lang/Object;Ljava/lang/Object;Z)Z
.end method

.method public static native n0113311111(Ljava/lang/Object;Ljava/lang/Object;ZZIZ)I
.end method

.method public static native n01133111111(Ljava/lang/Object;Ljava/lang/Object;IIIIZ)I
.end method

.method public static native n01133113(Ljava/lang/Object;Ljava/lang/Object;II)Ljava/lang/Object;
.end method

.method public static native n01133122(Ljava/lang/Object;Ljava/lang/Object;IJ)J
.end method

.method public static native n0113313(Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;
.end method

.method public static native n01133133(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native n011331330(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/Object;)V
.end method

.method public static native n0113313333(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native n011332(Ljava/lang/Object;Ljava/lang/Object;)J
.end method

.method public static native n0113322(Ljava/lang/Object;Ljava/lang/Object;J)J
.end method

.method public static native n011332332222(Ljava/lang/Object;Ljava/lang/Object;JLjava/lang/Object;Ljava/lang/Object;JJJ)J
.end method

.method public static native n011333(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native n0113330(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
.end method

.method public static native n0113331(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)I
.end method

.method public static native n01133312(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)J
.end method

.method public static native n01133313(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;
.end method

.method public static native n01133322(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;J)J
.end method

.method public static native n0113333(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native n01133331(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)I
.end method

.method public static native n01133331112(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;IZZ)J
.end method

.method public static native n01133333(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native n0113333313(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;
.end method

.method public static native pmark(Landroid/content/Context;)V
.end method

.method public static put(Ljava/lang/Object;[Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 329
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    .line 330
    sget-object v0, Lcom/stub/StubApp;->perm:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 331
    if-eqz v0, :cond_1

    .line 332
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 344
    :cond_0
    :goto_0
    return-void

    .line 334
    :cond_1
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    .line 335
    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 336
    sget-object v2, Lcom/stub/StubApp;->perm:Ljava/util/Map;

    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 337
    if-eqz v0, :cond_0

    .line 338
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static native rmark()V
.end method


# virtual methods
.method protected final attachBaseContext(Landroid/content/Context;)V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 144
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 145
    invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V

    .line 146
    invoke-static {}, Lcom/tianyu/util/a;->b()V

    .line 147
    sput-object p1, Lcom/stub/StubApp;->d:Landroid/content/Context;

    .line 148
    sget-object v0, Lcom/stub/StubApp;->a:Landroid/app/Application;

    if-nez v0, :cond_0

    .line 149
    sput-object p0, Lcom/stub/StubApp;->a:Landroid/app/Application;

    .line 151
    :cond_0
    sget-object v0, Lcom/stub/StubApp;->b:Landroid/app/Application;

    if-nez v0, :cond_6

    .line 153
    invoke-static {}, Lcom/tianyu/util/a;->a()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 154
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 155
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 156
    sget-object v2, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    const-string v4, "64"

    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    sget-object v2, Landroid/os/Build;->CPU_ABI2:Ljava/lang/String;

    const-string v4, "64"

    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 157
    :cond_1
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 159
    :cond_2
    sget-object v2, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    const-string v4, "mips"

    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    sget-object v2, Landroid/os/Build;->CPU_ABI2:Ljava/lang/String;

    const-string v4, "mips"

    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 160
    :cond_3
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 162
    :cond_4
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_5

    sget-boolean v2, Lcom/stub/StubApp;->needX86Bridge:Z

    if-eqz v2, :cond_5

    .line 163
    const-string v2, "X86Bridge"

    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 164
    :cond_5
    sget-boolean v2, Lcom/stub/StubApp;->loadFromLib:Z

    if-eqz v2, :cond_a

    .line 165
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_9

    sget-boolean v0, Lcom/stub/StubApp;->needX86Bridge:Z

    if-nez v0, :cond_9

    .line 166
    const-string v0, "jiagu_x86"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 206
    :cond_6
    :goto_0
    invoke-static {}, Lcom/tianyu/util/DtcLoader;->init()V

    .line 208
    sget-object v0, Lcom/stub/StubApp;->a:Landroid/app/Application;

    invoke-static {v0}, Lcom/stub/StubApp;->interface5(Landroid/app/Application;)V

    .line 209
    sget-object v0, Lcom/stub/StubApp;->b:Landroid/app/Application;

    if-nez v0, :cond_8

    .line 210
    invoke-static {p1}, Lcom/stub/StubApp;->a(Landroid/content/Context;)Landroid/app/Application;

    move-result-object v0

    sput-object v0, Lcom/stub/StubApp;->b:Landroid/app/Application;

    .line 211
    sget-object v0, Lcom/stub/StubApp;->b:Landroid/app/Application;

    if-eqz v0, :cond_10

    .line 213
    :try_start_0
    const-class v0, Landroid/app/Application;

    const-string v1, "attach"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Landroid/content/Context;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 214
    if-eqz v0, :cond_7

    .line 215
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 216
    sget-object v1, Lcom/stub/StubApp;->b:Landroid/app/Application;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 221
    :cond_7
    sget-object v0, Lcom/stub/StubApp;->b:Landroid/app/Application;

    invoke-static {v0, p1}, Lcom/stub/StubApp;->interface8(Landroid/app/Application;Landroid/content/Context;)Z

    .line 228
    :cond_8
    :goto_1
    return-void

    .line 168
    :cond_9
    const-string v0, "jiagu"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    goto :goto_0

    .line 171
    :cond_a
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 173
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    .line 177
    :goto_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "/.jiagu"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 178
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-static {v2, v4, v5}, Lcom/stub/StubApp;->a(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/stub/StubApp;->i:Ljava/lang/String;

    .line 179
    invoke-static {v2, v6, v6}, Lcom/stub/StubApp;->a(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/stub/StubApp;->e:Ljava/lang/String;

    .line 180
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/stub/StubApp;->e:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/stub/StubApp;->f:Ljava/lang/String;

    .line 181
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/stub/StubApp;->i:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/stub/StubApp;->g:Ljava/lang/String;

    .line 182
    sput-object v2, Lcom/stub/StubApp;->h:Ljava/lang/String;

    .line 183
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_b

    .line 184
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/stub/StubApp;->c:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "_mips.so"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/stub/StubApp;->e:Ljava/lang/String;

    invoke-static {p1, v4, v2, v5}, Lcom/tianyu/util/a;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 190
    :goto_3
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_f

    .line 192
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_d

    sget-boolean v0, Lcom/stub/StubApp;->needX86Bridge:Z

    if-nez v0, :cond_d

    .line 193
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/stub/StubApp;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_x64.so"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/stub/StubApp;->i:Ljava/lang/String;

    invoke-static {p1, v0, v2, v1}, Lcom/tianyu/util/a;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    .line 197
    :goto_4
    if-eqz v0, :cond_e

    .line 198
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/stub/StubApp;->i:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/System;->load(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 185
    :cond_b
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_c

    sget-boolean v4, Lcom/stub/StubApp;->needX86Bridge:Z

    if-nez v4, :cond_c

    .line 186
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/stub/StubApp;->c:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "_x86.so"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/stub/StubApp;->e:Ljava/lang/String;

    invoke-static {p1, v4, v2, v5}, Lcom/tianyu/util/a;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_3

    .line 188
    :cond_c
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/stub/StubApp;->c:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".so"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/stub/StubApp;->e:Ljava/lang/String;

    invoke-static {p1, v4, v2, v5}, Lcom/tianyu/util/a;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_3

    .line 195
    :cond_d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/stub/StubApp;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_a64.so"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/stub/StubApp;->i:Ljava/lang/String;

    invoke-static {p1, v0, v2, v1}, Lcom/tianyu/util/a;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    goto :goto_4

    .line 200
    :cond_e
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/stub/StubApp;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/System;->load(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 202
    :cond_f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/stub/StubApp;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/System;->load(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 218
    :catch_0
    move-exception v0

    .line 219
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Failed to call attachBaseContext."

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 223
    :cond_10
    invoke-static {v7}, Ljava/lang/System;->exit(I)V

    goto/16 :goto_1

    :catch_1
    move-exception v4

    goto/16 :goto_2
.end method

.method public synchronized native n10130(Ljava/lang/Object;)V
.end method

.method public synchronized native n101330(Ljava/lang/Object;Ljava/lang/Object;)V
.end method

.method public native declared-synchronized n11030(Ljava/lang/Object;)V
.end method

.method public native n1110()V
.end method

.method public native n1111()Z
.end method

.method public native n11110(Z)V
.end method

.method public native n11111(I)I
.end method

.method public native n111111(II)Z
.end method

.method public native n1111110(ZZZ)V
.end method

.method public native n1111111(III)I
.end method

.method public native n11111111(IIII)Z
.end method

.method public native n111111111(IIIII)Z
.end method

.method public native n11111111111111120(IIIZZZZZZZIIJ)V
.end method

.method public native n11111112230(IIIIJJLjava/lang/Object;)V
.end method

.method public native n111111133(IIIILjava/lang/Object;)Ljava/lang/Object;
.end method

.method public native n1111112(III)J
.end method

.method public native n11111132220(ZIILjava/lang/Object;JJJ)V
.end method

.method public native n11111133(IIILjava/lang/Object;)Ljava/lang/Object;
.end method

.method public native n1111130(ZZLjava/lang/Object;)V
.end method

.method public native n111120(IJ)V
.end method

.method public native n1111211230(IJZFDLjava/lang/Object;)V
.end method

.method public native n111130(ILjava/lang/Object;)V
.end method

.method public native n111131(ILjava/lang/Object;)I
.end method

.method public native n1111310(ILjava/lang/Object;I)V
.end method

.method public native n111132(ILjava/lang/Object;)J
.end method

.method public native n111133(ILjava/lang/Object;)Ljava/lang/Object;
.end method

.method public native n1111330(ILjava/lang/Object;Ljava/lang/Object;)V
.end method

.method public native n1111331(ILjava/lang/Object;Ljava/lang/Object;)Z
.end method

.method public native n11113311(ILjava/lang/Object;Ljava/lang/Object;I)Z
.end method

.method public native n1112()J
.end method

.method public native n11120(J)V
.end method

.method public native n11121(J)Z
.end method

.method public native n111210(JZ)V
.end method

.method public native n111211(JZ)Z
.end method

.method public native n1112110(JZZ)V
.end method

.method public native n1112111(JZI)I
.end method

.method public native n11121111(JIII)I
.end method

.method public native n111211111(JIIII)I
.end method

.method public native n111211111223(JIIIIIDD)Ljava/lang/Object;
.end method

.method public native n1112111131(JIIIILjava/lang/Object;)I
.end method

.method public native n111211213(JIIJZ)Ljava/lang/Object;
.end method

.method public native n11121123(JIIJ)Ljava/lang/Object;
.end method

.method public native n1112113(JII)Ljava/lang/Object;
.end method

.method public native n111211320(JIILjava/lang/Object;D)V
.end method

.method public native n1112113220(JIILjava/lang/Object;DD)V
.end method

.method public native n111211330(JIILjava/lang/Object;Ljava/lang/Object;)V
.end method

.method public native n111211331(JZILjava/lang/Object;Ljava/lang/Object;)I
.end method

.method public native n1112113330(JIILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
.end method

.method public native n111212(JI)J
.end method

.method public native n1112120(JBJ)V
.end method

.method public native n11121210(JIJI)V
.end method

.method public native n11121212(JIDZ)J
.end method

.method public native n1112122(JIJ)J
.end method

.method public native n111212210(JIJJZ)V
.end method

.method public native n11121222(JIDD)J
.end method

.method public native n111212310(JIJLjava/lang/Object;Z)V
.end method

.method public native n1112130(JILjava/lang/Object;)V
.end method

.method public native n11121311(JILjava/lang/Object;Z)I
.end method

.method public native n1112131111(JILjava/lang/Object;IIZ)I
.end method

.method public native n111213111111(JZLjava/lang/Object;ZFFZF)I
.end method

.method public native n11121311121111111(JILjava/lang/Object;IIIJZIIIIZ)I
.end method

.method public native n111213112(JILjava/lang/Object;ZZ)J
.end method

.method public native n11121312(JILjava/lang/Object;Z)J
.end method

.method public native n1112132(JILjava/lang/Object;)J
.end method

.method public native n11121322(JILjava/lang/Object;D)J
.end method

.method public native n111213312(JILjava/lang/Object;Ljava/lang/Object;Z)J
.end method

.method public native n11122(J)J
.end method

.method public native n111220(JJ)V
.end method

.method public native n111221(JJ)Z
.end method

.method public native n11122111112(JJIIIIZ)J
.end method

.method public native n111221111133(JJIZZZZLjava/lang/Object;)Ljava/lang/Object;
.end method

.method public native n1112211112123(JJIZZZJFD)Ljava/lang/Object;
.end method

.method public native n1112211113(JJIZZB)Ljava/lang/Object;
.end method

.method public native n11122111133(JJIZZZLjava/lang/Object;)Ljava/lang/Object;
.end method

.method public native n111221112(JJIII)J
.end method

.method public native n1112211123(JJIZZD)Ljava/lang/Object;
.end method

.method public native n11122112(JJIZ)J
.end method

.method public native n1112212(JJZ)J
.end method

.method public native n111222(JJ)J
.end method

.method public native n11122210(JJJZ)V
.end method

.method public native n11122212(JJJZ)J
.end method

.method public native n111222222(JJJJD)J
.end method

.method public native n11122223(JJJJ)Ljava/lang/Object;
.end method

.method public native n111222232(JJJJLjava/lang/Object;)J
.end method

.method public native n11122231132(JJJLjava/lang/Object;SZLjava/lang/Object;)J
.end method

.method public native n111222332(JJJLjava/lang/Object;Ljava/lang/Object;)J
.end method

.method public native n111223(JJ)Ljava/lang/Object;
.end method

.method public native n1112230(JJLjava/lang/Object;)V
.end method

.method public native n11122310(JJLjava/lang/Object;Z)V
.end method

.method public native n1112232(JJLjava/lang/Object;)J
.end method

.method public native n1112233(JJLjava/lang/Object;)Ljava/lang/Object;
.end method

.method public native n11122330(JJLjava/lang/Object;Ljava/lang/Object;)V
.end method

.method public native n111223310(JJLjava/lang/Object;Ljava/lang/Object;Z)V
.end method

.method public native n11123(J)Ljava/lang/Object;
.end method

.method public native n111230(JLjava/lang/Object;)V
.end method

.method public native n111231(JLjava/lang/Object;)Z
.end method

.method public native n1112310(JLjava/lang/Object;Z)V
.end method

.method public native n1112311(JLjava/lang/Object;I)I
.end method

.method public native n11123111(JLjava/lang/Object;IZ)I
.end method

.method public native n111231111(JLjava/lang/Object;III)I
.end method

.method public native n111231111110(JLjava/lang/Object;IIIIIZ)V
.end method

.method public native n1112312(JLjava/lang/Object;C)J
.end method

.method public native n1112313(JLjava/lang/Object;I)Ljava/lang/Object;
.end method

.method public native n11123131(JLjava/lang/Object;ILjava/lang/Object;)I
.end method

.method public native n111231311121111111(JLjava/lang/Object;ILjava/lang/Object;IIIJZIIIIZ)I
.end method

.method public native n111231313133311132(JLjava/lang/Object;ILjava/lang/Object;CLjava/lang/Object;CLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;IIILjava/lang/Object;)J
.end method

.method public native n1112313311111(JLjava/lang/Object;BLjava/lang/Object;Ljava/lang/Object;ZIII)I
.end method

.method public native n111232(JLjava/lang/Object;)J
.end method

.method public native n111233(JLjava/lang/Object;)Ljava/lang/Object;
.end method

.method public native n1112330(JLjava/lang/Object;Ljava/lang/Object;)V
.end method

.method public native n1112331(JLjava/lang/Object;Ljava/lang/Object;)I
.end method

.method public native n1112332(JLjava/lang/Object;Ljava/lang/Object;)J
.end method

.method public native n1112333(JLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public native n111233330(JLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
.end method

.method public native n1113()Ljava/lang/Object;
.end method

.method public native n11130(Ljava/lang/Object;)V
.end method

.method public native n11131(Ljava/lang/Object;)Z
.end method

.method public native n111310(Ljava/lang/Object;I)V
.end method

.method public native n111311(Ljava/lang/Object;I)Z
.end method

.method public native n1113111(Ljava/lang/Object;II)I
.end method

.method public native n11131111(Ljava/lang/Object;III)I
.end method

.method public native n111311111(Ljava/lang/Object;IIII)Z
.end method

.method public native n111312130(Ljava/lang/Object;IJILjava/lang/Object;)V
.end method

.method public native n11131230(Ljava/lang/Object;IJLjava/lang/Object;)V
.end method

.method public native n1113130(Ljava/lang/Object;ZLjava/lang/Object;)V
.end method

.method public native n1113131(Ljava/lang/Object;ILjava/lang/Object;)Z
.end method

.method public native n1113132(Ljava/lang/Object;ILjava/lang/Object;)J
.end method

.method public native n11132(Ljava/lang/Object;)J
.end method

.method public native n111320(Ljava/lang/Object;J)V
.end method

.method public native n111321(Ljava/lang/Object;J)Z
.end method

.method public native n11132130(Ljava/lang/Object;JILjava/lang/Object;)V
.end method

.method public native n11132230(Ljava/lang/Object;JJLjava/lang/Object;)V
.end method

.method public native n1113230(Ljava/lang/Object;JLjava/lang/Object;)V
.end method

.method public native n11133(Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public native n111330(Ljava/lang/Object;Ljava/lang/Object;)V
.end method

.method public native n111331(Ljava/lang/Object;Ljava/lang/Object;)Z
.end method

.method public native n11133110(Ljava/lang/Object;Ljava/lang/Object;ZI)V
.end method

.method public native n111331130(Ljava/lang/Object;Ljava/lang/Object;IZLjava/lang/Object;)V
.end method

.method public native n1113313(Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;
.end method

.method public native n11133130(Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;)V
.end method

.method public native n1113313133(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;
.end method

.method public native n111332(Ljava/lang/Object;Ljava/lang/Object;)J
.end method

.method public native n11133230(Ljava/lang/Object;Ljava/lang/Object;JLjava/lang/Object;)V
.end method

.method public native n111333(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public native n1113330(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
.end method

.method public native n1113331(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
.end method

.method public native n11133310(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
.end method

.method public native n111333110(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZZ)V
.end method

.method public native n1113331133(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZILjava/lang/Object;)Ljava/lang/Object;
.end method

.method public native n111333130(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;)V
.end method

.method public native n1113333(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public native n11133330(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
.end method

.method public native n111333332(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)J
.end method

.method public final onCreate()V
    .locals 5

    .prologue
    .line 128
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 129
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 132
    invoke-static {}, Lcom/stub/StubApp;->ChangeTopApplication()V

    .line 133
    sget-object v0, Lcom/stub/StubApp;->b:Landroid/app/Application;

    if-eqz v0, :cond_0

    .line 134
    sget-object v0, Lcom/stub/StubApp;->b:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->onCreate()V

    .line 137
    :cond_0
    sget-object v0, Lcom/stub/StubApp;->b:Landroid/app/Application;

    invoke-static {v0}, Lcom/stub/StubApp;->interface21(Landroid/app/Application;)V

    .line 138
    sget-object v0, Lcom/stub/StubApp;->b:Landroid/app/Application;

    if-eqz v0, :cond_1

    sget-object p0, Lcom/stub/StubApp;->b:Landroid/app/Application;

    :cond_1
    sget-object v0, Lcom/stub/StubApp;->d:Landroid/content/Context;

    .line 1247
    if-eqz p0, :cond_2

    if-eqz v0, :cond_2

    invoke-static {v0}, Lcom/tianyu/util/a;->a(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1256
    :cond_2
    :goto_0
    return-void

    .line 1250
    :cond_3
    :try_start_0
    const-string v0, "s\u007f}>zw>rx>Bu`\u007fbdcDy}u"

    invoke-static {v0}, Lcom/tianyu/util/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 1251
    const-string v1, "BuwycdubQsdyfydiSq||Rqs{c"

    invoke-static {v1}, Lcom/tianyu/util/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Landroid/app/Application;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1252
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 1253
    const/4 v1, 0x0

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 140
    :catch_0
    move-exception v0

    goto :goto_0
.end method
