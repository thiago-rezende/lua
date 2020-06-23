#include <stdio.h>
#include <stdlib.h>

#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

int main(int argc, char **argv)
{
    int result;
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);

    const char *script = "io.write(\"Hello Lua\")";

    result = luaL_dostring(L, script);

    if (result != LUA_OK)
    {
        fprintf(stderr, "Error: %s\n", lua_tostring(L, -1));
        lua_pop(L, 1);
        return 1;
    }

    lua_close(L);

    return 0;
}
