from .cmake import CmakePackage

from ..packaging import CmakeBuildPackage, package


@package
class RRPackage(CmakeBuildPackage):
    """rr: Record-and-Replay-based debugger."""

    name = "rr"
    homepage = "http://rr-project.org"
    version = "4.2.0"
    artifacts = ["bin/rr"]

    dependencies = [CmakePackage]

    url = "https://github.com/mozilla/rr/archive/4.2.0.tar.gz"
