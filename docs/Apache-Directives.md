# Apache directives overview #

---

To view Apache directives with descriptions use:

```shell
$ apachectl -L
```

### core.c: core_module (static) ###

```ApacheConf
<Directory
    Container for directives affecting resources located in the specified directories
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

<Location
    Container for directives affecting resources accessed through the specified URL paths
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

<VirtualHost
    Container to map directives to a particular virtual host, takes one or more host addresses
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

<Files
    Container for directives affecting files matching specified patterns
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None

<Limit
    Container for authentication directives when accessed using specified HTTP methods
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes AuthConfig or Limit

<LimitExcept
    Container for authentication directives to be applied when any HTTP method other than those specified is used to access the resource
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes AuthConfig or Limit

<IfModule
    Container for directives based on existence of specified modules
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None

<IfDefine
    Container for directives based on existence of command line defines
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None

<DirectoryMatch
    Container for directives affecting resources located in the specified directories
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

<LocationMatch
    Container for directives affecting resources accessed through the specified URL paths
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

<FilesMatch
    Container for directives affecting files matching specified patterns
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None

AddDefaultCharset
    The name of the default charset to add to any Content-Type without one or 'Off' to disable
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo

AcceptPathInfo
    Set to on or off for PATH_INFO to be accepted by handlers, or default for the per-handler preference
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo

Define
    Define a variable, optionally to a value.  Same as passing -D to the command line.
    Allowed in *.conf anywhere

UnDefine
    Undefine the existence of a variable. Undo a Define.
    Allowed in *.conf anywhere

Error
    Generate error message from within configuration
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None

<If
    Container for directives to be conditionally applied
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None

<ElseIf
    Container for directives to be conditionally applied
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None

<Else
    Container for directives to be conditionally applied
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None

AccessFileName
    Name(s) of per-directory config files (default: .htaccess)
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

DocumentRoot
    Root directory of the document tree
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

ErrorDocument
    Change responses for HTTP errors
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo

AllowOverride
    Controls what groups of directives can be configured by per-directory config files
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If>

AllowOverrideList
    Controls what individual directives can be configured by per-directory config files
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If>

Options
    Set a number of attributes for a given directory
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Options

DefaultType
    the default media type for otherwise untyped files (DEPRECATED)
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo

FileETag
    Specify components used to construct a file's ETag
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo

EnableMMAP
    Controls whether memory-mapping may be used to read files
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo

EnableSendfile
    Controls whether sendfile may be used to transmit files
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo

Protocol
    Set the Protocol for httpd to use.
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

AcceptFilter
    Set the Accept Filter to use for a protocol
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

Port
    Port was replaced with Listen in Apache 2.0
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

HostnameLookups
    "on" to enable, "off" to disable reverse DNS lookups, or "double" to enable double-reverse DNS lookups
    Allowed in *.conf anywhere

ServerAdmin
    The email address of the server administrator
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

ServerName
    The hostname and port of the server
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

ServerSignature
    En-/disable server signature (on|off|email)
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None

ServerRoot
    Common directory of server-related files (logs, confs, etc.)
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

DefaultRuntimeDir
    Common directory for run-time files (shared memory, locks, etc.)
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

ErrorLog
    The filename of the error log
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

ErrorLogFormat
    Format string for the ErrorLog
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

ServerAlias
    A name or names alternately used to access the server
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

ServerPath
    The pathname the server can be reached at
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

Timeout
    Timeout duration (sec)
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

ContentDigest
    whether or not to send a Content-MD5 header with each request
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Options

UseCanonicalName
    How to work out the ServerName : Port when constructing URLs
    Allowed in *.conf anywhere

UseCanonicalPhysicalPort
    Whether to use the physical Port when constructing URLs
    Allowed in *.conf anywhere

Include
    Name(s) of the config file(s) to be included; fails if the wildcard does not match at least one file
    Allowed in *.conf anywhere

IncludeOptional
    Name or pattern of the config file(s) to be included; ignored if the file does not exist or the pattern does not match any files
    Allowed in *.conf anywhere

LogLevel
    Level of verbosity in error logging
    Allowed in *.conf anywhere

NameVirtualHost
    A numeric IP address:port, or the name of a host
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

ServerTokens
    Determine tokens displayed in the Server: header - Min(imal), Major, Minor, Prod(uctOnly), OS, or Full
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

LimitRequestLine
    Limit on maximum size of an HTTP request line
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

LimitRequestFieldsize
    Limit on maximum size of an HTTP request header field
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

LimitRequestFields
    Limit (0 = unlimited) on max number of header fields in a request message
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

LimitRequestBody
    Limit (in bytes) on maximum size of request message body
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None

LimitXMLRequestBody
    Limit (in bytes) on maximum size of an XML-based request body
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None

Mutex
    mutex (or "default") and mechanism
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

MaxRanges
    Maximum number of Ranges in a request before returning the entire resource, or 0 for unlimited
    Allowed in *.conf anywhere

MaxRangeOverlaps
    Maximum number of overlaps in Ranges in a request before returning the entire resource, or 0 for unlimited
    Allowed in *.conf anywhere

MaxRangeReversals
    Maximum number of reversals in Ranges in a request before returning the entire resource, or 0 for unlimited
    Allowed in *.conf anywhere

RLimitCPU
    Soft/hard limits for max CPU usage in seconds
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None

RLimitMEM
    Soft/hard limits for max memory usage per process
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None

RLimitNPROC
    soft/hard limits for max number of processes per uid
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None

LimitInternalRecursion
    maximum recursion depth of internal redirects and subrequests
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

CGIPassAuth
    Controls whether HTTP authorization headers, normally hidden, will be passed to scripts
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes AuthConfig

QualifyRedirectURL
    Controls whether HTTP authorization headers, normally hidden, will be passed to scripts
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo

ForceType
    a mime type that overrides other configured type
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo

SetHandler
    a handler name that overrides any other configured handler
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo

SetOutputFilter
    filter (or ; delimited list of filters) to be run on the request content
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo

SetInputFilter
    filter (or ; delimited list of filters) to be run on the request body
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo

AllowEncodedSlashes
    Allow URLs containing '/' encoded as '%2F'
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

ScoreBoardFile
    A file for Apache to maintain runtime process management information
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

ExtendedStatus
    "On" to track extended status information, "Off" to disable
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

SeeRequestTail
    For extended status, "On" to see the last 63 chars of the request line, "Off" (default) to see the first 63
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

PidFile
    A file for logging the server process ID
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

MaxRequestsPerChild
    Maximum number of connections a particular child serves before dying. (DEPRECATED, use MaxConnectionsPerChild)
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

MaxConnectionsPerChild
    Maximum number of connections a particular child serves before dying.
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

CoreDumpDirectory
    The location of the directory Apache changes to before dumping core
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

MaxMemFree
    Maximum number of 1k blocks a particular child's allocator may hold.
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

ThreadStackSize
    Size in bytes of stack used by threads handling client connections
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

TraceEnable
    'on' (default), 'off' or 'extended' to trace request body content
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

MergeTrailers
    merge request trailers into request headers or not
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

Protocols
    Controls which protocols are allowed
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

ProtocolsHonorOrder
    'off' (default) or 'on' to respect given order of protocols, by default the client specified order determines selection
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

HttpProtocolOptions
    'Allow0.9' or 'Require1.0' (default); 'RegisteredMethods' or 'LenientMethods' (default); 'Unsafe' or 'Strict' (default). Sets HTTP acceptance rules
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

RegisterHttpMethod
    Registers non-standard HTTP methods
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>

```

### mod_so.c: so_module (static) ###

```ApacheConf
LoadModule
    a module name and the name of a shared object file to load it from
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
LoadFile
    shared object file or library to load into the server at runtime
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
```

### mod_watchdog.c: watchdog_module (static) ###

```ApacheConf
WatchdogInterval
    Watchdog interval in seconds
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
```

### http_core.c: http_module (static) ###

```ApacheConf
KeepAliveTimeout
    Keep-Alive timeout duration (sec)
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
MaxKeepAliveRequests
    Maximum number of Keep-Alive requests per connection, or 0 for infinite
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
KeepAlive
    Whether persistent connections should be On or Off
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
```

### mod_log_config.c: log_config_module (static) ###

```ApacheConf
CustomLog
    a file name, a custom log format string or format name, and an optional "env=" or "expr=" clause (see docs)
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
TransferLog
    the filename of the access log
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
LogFormat
    a log format string (see docs) and an optional format name
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
BufferedLogs
    Enable Buffered Logging (experimental)
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
```

### mod_logio.c: logio_module (static) ###

```ApacheConf
LogIOTrackTTFB
    Set to 'ON' to enable tracking time to first byte
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None
```

### mod_version.c: version_module (static) ###

```ApacheConf
<IfVersion
    a comparison operator, a version (and a delimiter)
    Allowed in *.conf anywhere [no per-dir config] and in .htaccess
    when AllowOverride isn't None
```

### mod_unixd.c: unixd_module (static) ###

```ApacheConf
User
    Effective user id for this server
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
Group
    Effective group id for this server
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ChrootDir
    The directory to chroot(2) into
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
Suexec
    Enable or disable suEXEC support
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
```

### mod_access_compat.c: access_compat_module (shared) ###

```ApacheConf
order
    'allow,deny', 'deny,allow', or 'mutual-failure'
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes Limit
allow
    'from' followed by hostnames or IP-address wildcards
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes Limit
deny
    'from' followed by hostnames or IP-address wildcards
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes Limit
Satisfy
    access policy if both allow and require used ('all' or 'any')
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes AuthConfig
```

### mod_alias.c: alias_module (shared) ###

```ApacheConf
Alias
    a fakename and a realname
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ScriptAlias
    a fakename and a realname
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
Redirect
    an optional status, then document to be redirected and destination URL
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
AliasMatch
    a regular expression and a filename
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ScriptAliasMatch
    a regular expression and a filename
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
RedirectMatch
    an optional status, then a regular expression and destination URL
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
RedirectTemp
    a document to be redirected, then the destination URL
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
RedirectPermanent
    a document to be redirected, then the destination URL
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
```

### mod_auth_basic.c: auth_basic_module (shared) ###

```ApacheConf
AuthBasicProvider
    specify the auth providers for a directory or location
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes AuthConfig
AuthBasicAuthoritative
    Set to 'Off' to allow access control to be passed along to lower modules if the UserID is not known to this module
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes AuthConfig
AuthBasicFake
    Fake basic authentication using the given expressions for username and password, 'off' to disable. Password defaults to 'password' if missing.
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes AuthConfig
AuthBasicUseDigestAlgorithm
    Set to 'MD5' to use the auth provider's authentication check for digest auth, using a hash of 'user:realm:pass'
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes AuthConfig
```

### mod_authn_core.c: authn_core_module (shared) ###

```ApacheConf
AuthType
    an HTTP authorization type (e.g., "Basic")
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes AuthConfig
AuthName
    the authentication realm (e.g. "Members Only")
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes AuthConfig
<AuthnProviderAlias
    container for grouping an authentication provider's directives under a provider alias
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
```

### mod_authn_file.c: authn_file_module (shared) ###

```ApacheConf
AuthUserFile
    text file containing user IDs and passwords
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes AuthConfig
```

### mod_authz_core.c: authz_core_module (shared) ###

```ApacheConf
<AuthzProviderAlias
    container for grouping an authorization provider's directives under a provider alias
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
Require
    specifies authorization directives which one must pass (or not) for a request to suceeed
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes AuthConfig
<RequireAll
    container for grouping authorization directives of which none must fail and at least one must pass for a request to succeed
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes AuthConfig
<RequireAny
    container for grouping authorization directives of which one must pass for a request to succeed
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes AuthConfig
<RequireNone
    container for grouping authorization directives of which none must pass for a request to succeed
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes AuthConfig
AuthMerging
    controls how a <Directory>, <Location>, or similar directive's authorization directives are combined with those of its predecessor
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes AuthConfig
AuthzSendForbiddenOnFailure
    Controls if an authorization failure should result in a '403 FORBIDDEN' response instead of the HTTP-conforming '401 UNAUTHORIZED'
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes AuthConfig
```

### mod_authz_groupfile.c: authz_groupfile_module (shared) ###

```ApacheConf
AuthGroupFile
    text file containing group names and member user IDs
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
    when AllowOverride includes AuthConfig
```

### mod_autoindex.c: autoindex_module (shared) ###

```ApacheConf
AddIcon
    an icon URL followed by one or more filenames
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
AddIconByType
    an icon URL followed by one or more MIME types
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
AddIconByEncoding
    an icon URL followed by one or more content encodings
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
AddAlt
    alternate descriptive text followed by one or more filenames
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
AddAltByType
    alternate descriptive text followed by one or more MIME types
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
AddAltByEncoding
    alternate descriptive text followed by one or more content encodings
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
IndexOptions
    one or more index options [+|-][]
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
IndexOrderDefault
    {Ascending,Descending} {Name,Size,Description,Date}
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
IndexIgnore
    one or more file extensions
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
IndexIgnoreReset
    Reset the inherited list of IndexIgnore filenames
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
AddDescription
    Descriptive text followed by one or more filenames
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
HeaderName
    a filename
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
ReadmeName
    a filename
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
FancyIndexing
    The FancyIndexing directive is no longer supported. Use IndexOptions FancyIndexing.
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None
DefaultIcon
    an icon URL
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
IndexStyleSheet
    URL to style sheet
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
IndexHeadInsert
    String to insert in HTML HEAD section
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
```

### mod_cgid.c: cgid_module (shared) ###

```ApacheConf
ScriptLog
    the name of a log for script debugging info
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ScriptLogLength
    the maximum length (in bytes) of the script debug log
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ScriptLogBuffer
    the maximum size (in bytes) to record of a POST request
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ScriptSock
    the name of the socket to use for communication with the cgi daemon.
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
CGIDScriptTimeout
    The amount of time to wait between successful reads from the CGI script, in seconds.
    Allowed in *.conf anywhere
```

### mod_deflate.c: deflate_module (shared) ###

```ApacheConf
DeflateFilterNote
    Set a note to report on compression ratio
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DeflateWindowSize
    Set the Deflate window size (1-15)
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DeflateBufferSize
    Set the Deflate Buffer Size
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DeflateMemLevel
    Set the Deflate Memory Level (1-9)
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DeflateCompressionLevel
    Set the Deflate Compression Level (1-9)
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DeflateInflateLimitRequestBody
    Set a limit on size of inflated input
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None
DeflateInflateRatioLimit
    Set the inflate ratio limit above which inflation is aborted (default: 200)
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None
DeflateInflateRatioBurst
    Set the maximum number of following inflate ratios above limit (default: 3)
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None
```

### mod_dir.c: dir_module (shared) ###

```ApacheConf
FallbackResource
    Set a default handler
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
DirectoryIndex
    a list of file names
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
DirectorySlash
    On or Off
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
DirectoryCheckHandler
    On or Off
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
DirectoryIndexRedirect
    On, Off, or a 3xx status code.
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Indexes
```

### mod_env.c: env_module (shared) ###

```ApacheConf
PassEnv
    a list of environment variables to pass to CGI.
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
SetEnv
    an environment variable name and optional value to pass to CGI.
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
UnsetEnv
    a list of variables to remove from the CGI environment.
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
```

### mod_filter.c: filter_module (shared) ###

```ApacheConf
FilterDeclare
    filter-name [filter-type]
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Options
FilterProvider
    filter-name provider-name match-expression
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Options
FilterChain
    list of filter names with optional [+-=!@]
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Options
FilterTrace
    filter-name debug-level
    Allowed in *.conf anywhere
AddOutputFilterByType
    output filter name followed by one or more content-types
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
FilterProtocol
    filter-name [provider-name] protocol-args
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Options
```

### mod_headers.c: headers_module (shared) ###

```ApacheConf
Header
    an optional condition, an action, header and value followed by optional env clause
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
RequestHeader
    an action, header and value followed by optional env clause
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
```

### mod_mime.c: mime_module (shared) ###

```ApacheConf
AddCharset
    a charset (e.g., iso-2022-jp), followed by one or more file extensions
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
AddEncoding
    an encoding (e.g., gzip), followed by one or more file extensions
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
AddHandler
    a handler name followed by one or more file extensions
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
AddInputFilter
    input filter name (or ; delimited names) followed by one or more file extensions
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
AddLanguage
    a language (e.g., fr), followed by one or more file extensions
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
AddOutputFilter
    output filter name (or ; delimited names) followed by one or more file extensions
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
AddType
    a mime type followed by one or more file extensions
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
DefaultLanguage
    language to use for documents with no other language file extension
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
MultiviewsMatch
    NegotiatedOnly (default), Handlers and/or Filters, or Any
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
RemoveCharset
    one or more file extensions
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
RemoveEncoding
    one or more file extensions
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
RemoveHandler
    one or more file extensions
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
RemoveInputFilter
    one or more file extensions
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
RemoveLanguage
    one or more file extensions
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
RemoveOutputFilter
    one or more file extensions
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
RemoveType
    one or more file extensions
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
TypesConfig
    the MIME types config file
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ModMimeUsePathInfo
    Set to 'yes' to allow mod_mime to use path info for type checking
    Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If>
```

### prefork.c: mpm_prefork_module (shared) ###

```ApacheConf
ListenBacklog
    Maximum length of the queue of pending connections, as used by listen(2)
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ListenCoresBucketsRatio
    Ratio between the number of CPU cores (online) and the number of listeners buckets
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
Listen
    A port number or a numeric IP address and a port number, and an optional protocol
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
SendBufferSize
    Send buffer size in bytes
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ReceiveBufferSize
    Receive buffer size in bytes
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
StartServers
    Number of child processes launched at server startup
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
MinSpareServers
    Minimum number of idle children, to handle request spikes
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
MaxSpareServers
    Maximum number of idle children
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
MaxClients
    Deprecated name of MaxRequestWorkers
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
MaxRequestWorkers
    Maximum number of children alive at the same time
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ServerLimit
    Maximum value of MaxRequestWorkers for this run of Apache
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
GracefulShutdownTimeout
    Maximum time in seconds to wait for child processes to complete transactions during shutdown
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
```

### mod_negotiation.c: negotiation_module (shared) ###

```ApacheConf
CacheNegotiatedDocs
    Either 'on' or 'off' (default)
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
LanguagePriority
    space-delimited list of MIME language abbreviations
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
ForceLanguagePriority
    Force LanguagePriority elections, either None, or Fallback and/or Prefer
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
```

### mod_php7.c: php7_module (shared) ###

```ApacheConf
php_value
    PHP Value Modifier
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Options
php_flag
    PHP Flag Modifier
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes Options
php_admin_value
    PHP Value Modifier (Admin)
    Allowed in *.conf anywhere
php_admin_flag
    PHP Flag Modifier (Admin)
    Allowed in *.conf anywhere
PHPINIDir
    Directory containing the php.ini file
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
```

### mod_proxy.c: proxy_module (shared) ###

```ApacheConf
BalancerMember
    A balancer name and scheme with list of params
    Allowed in *.conf anywhere
BalancerGrowth
    Number of additional Balancers that can be added post-config
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
BalancerPersist
    on if the balancer should persist changes on reboot/restart made via the Balancer Manager
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
BalancerInherit
    on if this server should inherit Balancers and Workers defined in the main server (Setting to off recommended if using the Balancer Manager)
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
<Proxy
    Container for directives affecting resources located in the proxied location
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
<ProxyMatch
    Container for directives affecting resources located in the proxied location, in regular expression syntax
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyRequests
    on if the true proxy requests should be accepted
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyRemote
    a scheme, partial URL or '*' and a proxy server
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyRemoteMatch
    a regex pattern and a proxy server
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyPassInterpolateEnv
    Interpolate Env Vars in reverse Proxy
    Allowed in *.conf anywhere
ProxyPass
    a virtual path and a URL
    Allowed in *.conf anywhere
ProxyPassMatch
    a virtual path and a URL
    Allowed in *.conf anywhere
ProxyPassReverse
    a virtual path and a URL for reverse proxy behaviour
    Allowed in *.conf anywhere
ProxyPassReverseCookiePath
    Path rewrite rule for proxying cookies
    Allowed in *.conf anywhere
ProxyPassReverseCookieDomain
    Domain rewrite rule for proxying cookies
    Allowed in *.conf anywhere
ProxyBlock
    A list of names, hosts or domains to which the proxy will not connect
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyReceiveBufferSize
    Receive buffer size for outgoing HTTP and FTP connections in bytes
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyIOBufferSize
    IO buffer size for outgoing HTTP and FTP connections in bytes
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyMaxForwards
    The maximum number of proxies a request may be forwarded through.
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
NoProxy
    A list of domains, hosts, or subnets to which the proxy will connect directly
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyDomain
    The default intranet domain name (in absence of a domain in the URL)
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyVia
    Configure Via: proxy header header to one of: on | off | block | full
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyErrorOverride
    use our error handling pages instead of the servers' we are proxying
    Allowed in *.conf anywhere
ProxyPreserveHost
    on if we should preserve host header while proxying
    Allowed in *.conf anywhere
ProxyTimeout
    Set the timeout (in seconds) for a proxied connection. This overrides the server timeout
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyBadHeader
    How to handle bad header line in response: IsError | Ignore | StartBody
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyPassInherit
    on if this server should inherit all ProxyPass directives defined in the main server (Setting to off recommended if using the Balancer Manager)
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyStatus
    Configure Status: proxy status to one of: on | off | full
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxySet
    A balancer or worker name with list of params
    Allowed in *.conf anywhere
ProxySourceAddress
    Configure local source IP used for request forward
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyAddHeaders
    on if X-Forwarded-* headers should be added or completed
    Allowed in *.conf anywhere
```

### mod_proxy_html.c: proxy_html_module (shared) ###

```ApacheConf
ProxyHTMLEvents
    Strings to be treated as scripting events
    Allowed in *.conf anywhere
ProxyHTMLLinks
    Declare HTML Attributes
    Allowed in *.conf anywhere
ProxyHTMLURLMap
    Map URL From To
    Allowed in *.conf anywhere
ProxyHTMLDoctype
    (HTML|XHTML) [Legacy]
    Allowed in *.conf anywhere
ProxyHTMLFixups
    Options are lowercase, dospath
    Allowed in *.conf anywhere
ProxyHTMLMeta
    Fix META http-equiv elements
    Allowed in *.conf anywhere
ProxyHTMLInterp
    Support interpolation and conditions in URLMaps
    Allowed in *.conf anywhere
ProxyHTMLExtended
    Map URLs in Javascript and CSS
    Allowed in *.conf anywhere
ProxyHTMLStripComments (mod_proxy_html.c)
    Strip out comments
    Allowed in *.conf anywhere
ProxyHTMLBufSize
    Buffer size
    Allowed in *.conf anywhere
ProxyHTMLCharsetOut (mod_proxy_html.c)
    Usage: ProxyHTMLCharsetOut charset
    Allowed in *.conf anywhere
ProxyHTMLEnable (mod_proxy_html.c)
    Enable proxy-html and xml2enc filters
    Allowed in *.conf anywhere
```

### mod_proxy_msrpc.c: proxy_msrpc_module (shared) ###

```ApacheConf
OutlookAnywherePassthrough
    Enable passthrough of Outlook Anywhere traffic
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
OutlookAnywhereUserAgents
    User-Agents that should be treated as Outlook Anywhere
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
OutlookAnywhereSOCache
    SOCache provider for Outlook Anywhere
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
OutlookAnywhereSOCacheExpire
    Expiry for Outlook Anywhere session cache
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
```

### mod_reqtimeout.c: reqtimeout_module (shared) ###

```ApacheConf
RequestReadTimeout
    Set various timeout parameters for reading request headers and body
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
```

### mod_rewrite.c: rewrite_module (shared) ###

```ApacheConf
RewriteEngine
    On or Off to enable or disable (default) the whole rewriting engine
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
RewriteOptions
    List of option strings to set
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
RewriteBase
    the base URL of the per-directory context
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
RewriteCond
    an input string and a to be applied regexp-pattern
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
RewriteRule
    an URL-applied regexp-pattern and a substitution URL
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
RewriteMap
    a mapname and a filename
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
```

### mod_setenvif.c: setenvif_module (shared) ###

```ApacheConf
SetEnvIf
    A header-name, regex and a list of variables.
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
SetEnvIfNoCase
    a header-name, regex and a list of variables.
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
SetEnvIfExpr
    an expression and a list of variables.
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
BrowserMatch
    A browser regex and a list of variables.
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
BrowserMatchNoCase
    A browser regex and a list of variables.
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride includes FileInfo
```

### mod_xml2enc.c: xml2enc_module (shared) ###

```ApacheConf
xml2EncDefault
    Usage: xml2EncDefault charset
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None
xml2EncAlias
    EncodingAlias charset alias [more aliases]
    Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
xml2StartParse
    Ignore anything in front of the first of these elements
    Allowed in *.conf anywhere and in .htaccess
    when AllowOverride isn't None
```

---

:scorpius:
