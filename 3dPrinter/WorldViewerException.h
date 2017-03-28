#ifndef WORLDVIEWEREXCEPTION_H
#define WORLDVIEWEREXCEPTION_H

#include <QException>

#include <string>

class WorldViewerException : public QException
{
public:
    WorldViewerException(std::string what) : m_what(std::move(what))
    {
    }

    const char * what() const
    {
        return m_what.c_str();
    }

    void raise() const
    {
        throw *this;
    }

    WorldViewerException *clone() const
    {
        return new WorldViewerException(m_what);
    }

private:
    const std::string m_what;
};

#endif // WORLDVIEWEREXCEPTION_H
