from ..packaging import AutotoolsPackage, package


@package
class WxWidgetsPackage(AutotoolsPackage):
    """wxwidgets for GTK+"""

    name = "wxwidgets"
    homepage = "http://wxwidgets.org"
    version = "3.0.2"

    url = "https://github.com/wxWidgets/wxWidgets/releases/download/v3.0.2/wxWidgets-3.0.2.tar.bz2"
    artifacts = ["bin/wx-config", "include/wx", "lib/libwx*"]

    configure_options = [
        "--with-gtk=3"
    ]
