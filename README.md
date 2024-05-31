This is a dockerfile for `LogicReinc.BlendFarm`

## Running the project

`docker run --rm -p 15000:15000 -v "blenderfarm_data:/blendfarm/BlenderData" -v "blenderfarm_files:/blendfarm/BlenderFiles" ghcr.io/lyze237-packages/docker-logicreinc.blendfarm:main`

## Volumes

BlendFarm stores downloaded blender versions and cache files in `/blendfarm/BlenderData` and `/blendfarm/BlenderFiles`.

