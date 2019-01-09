/* ************************************************************************
 * Copyright (c) 2017 blueorbitz                                          *
 *                                                                        *
 * This file is part of QtOneSignal                                       *
 *                                                                        *
 * QtOneSignal is free software: you can redistribute it and/or modify    *
 * it under the terms of the GNU General Public License as published by   *
 * the Free Software Foundation, either version 3 of the License, or      *
 * (at your option) any later version.                                    *
 *                                                                        *
 * This program is distributed in the hope that it will be useful,        *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of         *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                   *
 * See the GNU General Public License for more details.                   *
 *                                                                        *
 * You should have received a copy of the GNU General Public License      *
 * along with this program. If not, see <http://www.gnu.org/licenses/>.   *
 * ********************************************************************** */

#ifdef __ANDROID__

#include "notificator.h"
#include <jni.h>
#include <QtAndroidExtras>

const QString activityClass(".NotificatorBinding");
const QString packageName("org.pwf.notificator");

//void Notificator::sendTag(QString key, QString value)
//{
//    QAndroidJniObject jkey = QAndroidJniObject::fromString(key);
//    QAndroidJniObject jvalue = QAndroidJniObject::fromString(value);

//    QByteArray className = QString(packageName + activityClass).toLatin1();
//    QAndroidJniObject::callStaticMethod<void>(
//        className, "showNotification", "(Ljava/lang/String;Ljava/lang/String;)V",
//        jkey.object<jstring>(),
//                jvalue.object<jstring>());
//}

void Notificator::schedule(int hours, int minutes)
{
    qDebug()<<"schedule "<<hours<<minutes;
//    QAndroidJniObject jhours = QAndroidJniObject::fromString(QString::number(hours));
//    QAndroidJniObject jminutes = QAndroidJniObject::fromString(QString::number(minutes));

    QByteArray className = QString(packageName + activityClass).toLatin1();
    QAndroidJniObject::callStaticMethod<void>(
        className, "setReminder", "(II)V",
        hours,
                minutes                );
}

bool Notificator::findNewArticle()
{
    QByteArray className = QString(packageName + activityClass).toLatin1();
    jint b = QAndroidJniObject::getStaticField<jint>(
        className, "FIND_NEW_ARTICLE");
    bool cb = (bool)(b == JNI_TRUE);
    return cb;
}

void Notificator::setFindNewArticle(bool v)
{
    QByteArray className = QString(packageName + activityClass).toLatin1();
    QAndroidJniObject::setStaticField(
        className, "FIND_NEW_ARTICLE", v ? 1:0);
}

//void Notificator::deleteTag(QString key)
//{
//    QAndroidJniObject jkey = QAndroidJniObject::fromString(key);

//    QByteArray className = QString(packageName + activityClass).toLatin1();
//    QAndroidJniObject::callStaticMethod<void>(
//        className, "deleteTag", "(Ljava/lang/String;)V",
//        jkey.object<jstring>());
//}

static void cppNotificationReceived(JNIEnv *, jclass /*clazz*/, jstring s)
{
    QAndroidJniObject javaRetObj = (QAndroidJniObject)s;

    QString javastring = javaRetObj.toString();

   Notificator::instance()->setNotificationReceive(javastring);
}
//QString Norificator::getPlayerId()
//{
//    QAndroidJniObject activity = QtAndroid::androidActivity();
//    QAndroidJniObject id = activity.callObjectMethod<jstring>("getPlayerId");
//    qDebug()<<"Get Player ID: "<< id.toString();
//    return id.toString();
//}
//QString Norificator::getNewQuestionsId()
//{
//    QAndroidJniObject activity = QtAndroid::androidActivity();
//    QAndroidJniObject id = activity.callObjectMethod<jstring>("getQuestionsId");
//    qDebug()<<"Get ID: "<< id.toString();
//    return id.toString();
//}

static void cppNotificationOpened(JNIEnv *, jclass /*clazz*/, jstring s)
{
    QAndroidJniObject javaRetObj = (QAndroidJniObject)s;

    QString javastring = javaRetObj.toString();
   Notificator::instance()->setNotificationOpen(javastring);
}
static JNINativeMethod methods[] = {
    {"notificationReceive", "(Ljava/lang/String;)V", (void *)cppNotificationReceived},
    {"notificationOpen", "(Ljava/lang/String;)V", (void *)cppNotificationOpened}
};

jint JNICALL JNI_OnLoad(JavaVM *vm, void *)
{
    qDebug()<<"JNI started";
    JNIEnv *env;
    if (vm->GetEnv(reinterpret_cast<void **>(&env), JNI_VERSION_1_6) != JNI_OK)
        return JNI_FALSE;
    qDebug()<<"JNI version checked";
    QString qnativeClass = packageName + activityClass;
    qnativeClass = qnativeClass.replace(".", "/");
    QByteArray ba = qnativeClass.toLatin1();
    const char *pzsNativeClass = ba.data();

    qDebug()<<"JNI native class "<<qnativeClass;
    qDebug()<<"Methods count "<<sizeof(methods) / sizeof(methods[0]);
    jclass clazz = env->FindClass(pzsNativeClass);
    if (env->RegisterNatives(clazz, methods, sizeof(methods) / sizeof(methods[0])) < 0)
        return JNI_FALSE;

    qDebug()<<"JNI registerd natives";
    return JNI_VERSION_1_6;
}
#endif

