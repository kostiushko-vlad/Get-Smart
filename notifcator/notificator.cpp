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

#include "notificator.h"
#include <QQmlEngine>
#include <QDebug>
Notificator* Notificator::m_instance = 0;


Notificator::Notificator(QObject *parent)
{

}

Notificator::~Notificator() {
	// nothing to do
}

void Notificator::registerQMLTypes()
{

    qmlRegisterSingletonType<Notificator>("Notificator", 1, 0, "Notificator", qNotificatorProvider);
}

QObject* Notificator::qNotificatorProvider(QQmlEngine *engine, QJSEngine *scriptEngine) {
    qDebug() << "Creating Notificator singleton Instance in provider";
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)
    if(!m_instance)
        m_instance = new Notificator;
    return m_instance;
}

Notificator* Notificator::instance() {
       if (m_instance == 0)
       {
            qDebug() << "Creating Notificator singleton Instance in provider";
           m_instance = new Notificator;
       }

       return m_instance;
}

QString Notificator::notificationReceive() {
    return m_notificationReceive;
}

void Notificator::setNotificationReceive(QString message) {
    qDebug()<< "setNotificationReceive"<<message;
    if (message != m_notificationReceive) {
        m_notificationReceive = message;
        emit notificationReceiveChanged(m_notificationReceive);
    }
}

QString Notificator::notificationOpen() {
    return m_notificationOpen;
}

void Notificator::setNotificationOpen(const QString message) {
    if (message != m_notificationOpen) {
        m_notificationOpen = message;
        emit notificationOpenChanged(m_notificationOpen);
    }
}


