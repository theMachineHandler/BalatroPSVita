--[[
    Does this even need to exist?
]]--

local bit = require("bit")

local Texture = Object:new("Texture")

local TextureType = {
    TEXTURE_2D = 0,
    TEXTURE_VOLUME = 1,
    TEXTURE_2D_ARRAY = 2,
    TEXTURE_CUBE = 3,
    TEXTURE_MAX_ENUM = 4
}

local PixelFormatUsage = {
	PIXELFORMATUSAGE_SAMPLE = 0,       --Any sampling in shaders.
	PIXELFORMATUSAGE_LINEAR = 1,       --Linear filtering.
	PIXELFORMATUSAGE_RENDERTARGET = 2, --Usable as a render target.
	PIXELFORMATUSAGE_BLEND = 3,        --Blend support when used as a render target.
	PIXELFORMATUSAGE_MSAA = 4,         --MSAA support when used as a render target.
	PIXELFORMATUSAGE_COMPUTEWRITE = 5, --Writable in compute shaders via imageStore.
	PIXELFORMATUSAGE_MAX_ENUM = 6
}

local PixelFormatUsageFlags = {
	PIXELFORMATUSAGEFLAGS_NONE = 0,
	PIXELFORMATUSAGEFLAGS_SAMPLE = bit.lshift(1, PixelFormatUsage.PIXELFORMATUSAGE_SAMPLE),
	PIXELFORMATUSAGEFLAGS_LINEAR = bit.lshift(1, PixelFormatUsage.PIXELFORMATUSAGE_LINEAR),
	PIXELFORMATUSAGEFLAGS_RENDERTARGET = bit.lshift(1, PixelFormatUsage.PIXELFORMATUSAGE_RENDERTARGET),
	PIXELFORMATUSAGEFLAGS_BLEND = bit.lshift(1, PixelFormatUsage.PIXELFORMATUSAGE_BLEND),
	PIXELFORMATUSAGEFLAGS_MSAA = bit.lshift(1, PixelFormatUsage.PIXELFORMATUSAGE_MSAA),
	PIXELFORMATUSAGEFLAGS_COMPUTEWRITE = bit.lshift(1, PixelFormatUsage.PIXELFORMATUSAGE_COMPUTEWRITE),
}

local SamplerState = {
    WrapMode = {
        WRAP_CLAMP = 0,
		WRAP_CLAMP_ZERO = 1,
		WRAP_CLAMP_ONE = 2,
		WRAP_REPEAT = 4,
		WRAP_MIRRORED_REPEAT = 5,
		WRAP_MAX_ENUM = 6
    },

    FilterMode = {
        FILTER_LINEAR = 0,
		FILTER_NEAREST = 1,
		FILTER_MAX_ENUM = 2,
    },

    MipmapFilterMode = {
		MIPMAP_FILTER_NONE = 0,
		MIPMAP_FILTER_LINEAR = 1,
		MIPMAP_FILTER_NEAREST = 2,
		MIPMAP_FILTER_MAX_ENUM = 3
	},

}

local minFilter = SamplerState.FilterMode.FILTER_LINEAR
local magFilter = SamplerState.FilterMode.FILTER_LINEAR;
local mipmapFilter = SamplerState.MipmapFilterMode.MIPMAP_FILTER_NONE;

local wrapU = SamplerState.WrapMode.WRAP_CLAMP;
local wrapV = SamplerState.WrapMode.WRAP_CLAMP;
local wrapW = SamplerState.WrapMode.WRAP_CLAMP;

local lodBias = 0.0

local maxAnisotropy = 1

local minLod = 0
local maxLod = 255


function Texture:new(height)
    self = Object:new(self.name, self)
    self.pixelHeight = height
	return self
end

Logger.logfile("love class - Texture module loaded")
