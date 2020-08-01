/
    To try to replicate python's configparser lib
\

\d .config

// Check if its of []
checkNS: {all removeSpecChars["\t\n\r /";x] like/: ("[[]*";"*[]]")};

// Remove all special characters
removeSpecChars: {y except x};

// Remove leading spaces
removeLeadSpaces: {
    raze $[count f; except[first[f] # x;" "]; ""], (f: x ss ":") _ x
 };

// Use blocks to determine if it should be appended
parseConfig: {[ns;str]
    $[checkNS[str] and 2 = sum str in "[]"; 
        parseNS[ns; str];
        addConfig[ns; removeLeadSpaces removeSpecChars["\t\n\r/"; str]]
    ]
 };

// Check indent config
parseNS: {[ns;str]
    $["/" ~ first n: removeSpecChars["\t\n\r ";str];
            [
            subNS: first n ss "[";  // Check number of subspaces
            if[subNS <> count subNS sublist 1_ ` vs ns; 
                '"Invalid config file"
            ];
            .Q.dd[(1 + subNS) sublist ` vs ns; `$ removeSpecChars["\t\n\r /[]";str]]
            ];
        count n: n except "[]"; 
            .Q.dd[`; `$n]; 
        `
    ]
 };

// Add config 
addConfig: {[ns;str]
    if[not count str; :`];
    0 $[null ns; str; string[ns],".",str];
    ns
 };

// Load config - Remove all those with comments
loadConfig: {[filePath] 
    file: read0 filePath;
    "b"$ count parseConfig/[`; file where not file like "#*"]
 };

\d .

\ 
Example to read a config file
1) .config.loadConfig `:config.ini