.class public Lcom/codex/clean/NoAdLauncherActivity;
.super Landroid/app/Activity;
.source "NoAdLauncherActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0}, Lcom/codex/clean/NoAdLauncherActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.stone.app.ui.activity.MainActivityHome"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/codex/clean/NoAdLauncherActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-virtual {p0}, Lcom/codex/clean/NoAdLauncherActivity;->finish()V

    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method
