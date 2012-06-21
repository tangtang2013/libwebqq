%module (directors="1") libwebqqpython
%{
#include <stdio.h>
#include <Action.h>
#include <QQTypes.h>
#include <Singleton.h>
#include <QQPlugin.h>
#include <json/json.h>
%}
%include "Action.h"
%include stl.i
%include "std_string.i"
%include "std_map.i"
%include "std_pair.i"

%feature("director") Action;
%pythonprepend Action::setAction %{
        args[1].thisown=0
%}
%template(ActionString) Action<std::string>;
%include "Singleton.h"
%include "QQTypes.h"
%include "QQPlugin.h"
%include "json/json.h"
%template(SingletonQQConfig) Singleton<QQConfig>;
%template(SingletonQQPlugin) Singleton<QQPlugin>;
%template(SingletonResourceManager) Singleton<ResourceManager>;

namespace std{
        %template(map_string_qqgroup) map<std::string , QQGroup>; 
        %template(map_string_qqbuddy) map<std::string , QQBuddy>;
}
%template() std::pair<swig::SwigPtr_PyObject, swig::SwigPtr_PyObject>;
%template(pymap) std::map<swig::SwigPtr_PyObject, swig::SwigPtr_PyObject>;
