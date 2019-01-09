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

#include <QObject>
#include <QQmlEngine>
#include <QGuiApplication>

class Notificator : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString notificationReceive READ notificationReceive WRITE setNotificationReceive NOTIFY notificationReceiveChanged)
    Q_PROPERTY(QString notificationOpen READ notificationOpen WRITE setNotificationOpen NOTIFY notificationOpenChanged)

public:
    /*! singleton object */
    Notificator(QObject* parent=0);
    ~Notificator();

    static void registerQMLTypes();

    /*! singleton type provider function for Qt Quick */
    static QObject* qNotificatorProvider(QQmlEngine *engine, QJSEngine *scriptEngine);

    /*! singleton object provider for C++ */
    static Notificator* instance();
public slots:
    QString notificationReceive();
    void setNotificationReceive(QString message);

    QString notificationOpen();
    void setNotificationOpen(QString message);

   // void sendTag(QString key, QString value);
    #ifdef __ANDROID__
    void schedule(int hours, int minutes);
    bool findNewArticle();
    void setFindNewArticle(bool v);
    #endif
    //void deleteTag(QString key);
signals:
    void setQuestionIdSignal(const QString &id);
    void newQuestionsIdChanged();
    void notificationReceiveChanged(QString message);
    void notificationOpenChanged(QString message);
    void playerIdChanged();

private:
    static Notificator* m_instance;
    QString m_notificationReceive;
    QString m_notificationOpen;
};
