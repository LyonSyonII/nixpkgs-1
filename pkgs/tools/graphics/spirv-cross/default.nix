{ lib, stdenv, fetchFromGitHub, cmake, python3 }:

stdenv.mkDerivation (finalAttrs: {
  pname = "spirv-cross";
  version = "1.3.243.0";

  src = fetchFromGitHub {
    owner = "KhronosGroup";
    repo = "SPIRV-Cross";
    rev = "sdk-${finalAttrs.version}";
    hash = "sha256-snxbTI4q0YQq8T5NQD3kcsN59iJnhlLiu1Fvr+fCDeQ=";
  };

  nativeBuildInputs = [ cmake python3 ];

  meta = with lib; {
    description = "A tool designed for parsing and converting SPIR-V to other shader languages";
    homepage = "https://github.com/KhronosGroup/SPIRV-Cross";
    changelog = "https://github.com/KhronosGroup/SPIRV-Cross/releases/tag/${version}";
    platforms = platforms.all;
    license = licenses.asl20;
    maintainers = with maintainers; [ Flakebi ];
  };
})
