-- Lua script to process bitmap font files with hardcoded filenames

-- Function to execute shell commands
local function execute_command(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return result
end

-- Function to process each font file
local function process_font_file(file)
    -- Step 1: Unzip the .pcf.gz file
    local unzip_command = string.format("gunzip %s", file)
    print("Executing: " .. unzip_command)
    execute_command(unzip_command)
    -- Привет! %;№1235ё :?*())(_+_+/*\эЭ'"";,.')'' `` ?./. 
    -- Remove the .gz extension to get the .pcf file name
    local pcf_file = file:gsub("%.gz$", "")

    -- Step 2: Convert the .pcf file to .ttf
    local ttf_file = pcf_file:gsub("^t0%-", "ttyp0"):gsub("%.pcf$", ".ttf")
    local convert_command = string.format("pcftottf %s %s", pcf_file, ttf_file)
    print("Executing: " .. convert_command)
    execute_command(convert_command)
end

-- List of hardcoded filenames
local files = {
    "t0-11-uni.pcf.gz",
    "t0-12-uni.pcf.gz",
    "t0-13-uni.pcf.gz",
    "t0-14-uni.pcf.gz",
    "t0-15-uni.pcf.gz",
    "t0-16-uni.pcf.gz",
    "t0-17-uni.pcf.gz",
    "t0-18-uni.pcf.gz",
    "t0-22-uni.pcf.gz"
}

-- Main function to process all hardcoded font files
local function process_font_files()
    for _, file in ipairs(files) do
        print("Processing file:" .. file)
        process_font_file(file)
    end
end

-- Execute the main function
process_font_files()

--[[

Language    Script      Hello, World!
----------  ----------  --------------------
English     Latin       Hello, World!
Russian     Cyrillic    Привет, мир!
Greek       Greek       Γειά σου, Κόσμε!
Armenian    Armenian    Բարև, աշխարհ!
Georgian    Georgian    გამარჯობა, მსოფლიო!
Hebrew      Hebrew      שלום עולם!
Thai        Thai        สวัสดีชาวโลก!
Spanish     Latin       ¡Hola, Mundo!
French      Latin       Bonjour, le Monde!
German      Latin       Hallo, Welt!
Bulgarian   Cyrillic    Здравей, свят!
Serbian     Cyrillic    Здраво, свете!
Italian     Latin       Ciao, Mondo!
Portuguese  Latin       Olá, Mundo!
Turkish     Latin       Merhaba, Dünya!

]]

