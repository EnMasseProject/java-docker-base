
Environment variables which may be used to influence the application startup:

* **JAVA_OPTS** – Additional options, set when using the container
* **JAVA_APP_OPTS** – Additional options, intended to be set in derived containers
* **JAVA_DEBUG** – Enables Java debugging when set to `true`
* **DISABLE_DEFAULT_OPTS** – Will disable the default Java options, only additional options will be used
* **DISABLE_APP_OPTS** – Will disable the additional options from `JAVA_APP_OPTS`

Unless you override everything with the `DISABLE_DEFAULT_OPTS` setting, this profile
uses the container limits and uses the default settings for memory and CPU.

In order to tweak the maximum heap percentage (of the container limit) you can use `-XX:MaxRAMPercentage=<percent>` in
the `JAVA_OPTS` (e.g. `JAVA_OPTS="-XX:MaxRAMPercentage=50"`).
