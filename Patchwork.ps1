﻿Function New-PatchworkSource
{
    param(
        [String]$Author,
        [String]$Source,
        [String]$Target
    )
    new-object psobject -Property @{
        Author=$Author
        Source=$Source
        Target=$Target
    }
}
import-module "$PSScriptRoot\Bin\DeepZoomTools.DLL"

$sources = @(
    #New-PatchworkSource -Target "Patchwork.17mm.Mosaic" -Author Lefty -Source "D:\Backups\Camera\2019\Andromeda to Orion\17mm\Lefty.Patchwork.17mm.Mosaic.jpg"
    #New-PatchworkSource -Target "Taurus.135mm.Panel5" -Author eigenVector -Source "D:\Backups\Camera\OneDrive\Pictures\Astrophotography\Taurus to Pleiades\P5.59x120s.integration.crop.dbe.bn.pcc.solved.NR.Final.jpg"
    #New-PatchworkSource -Target "Horsehead" -Author "hotspicybonr" -Source "https://i.redd.it/yoi99i9z76341.jpg"
    #New-PatchworkSource -Target "M34" -Author "Lefty" -Source "https://i.imgur.com/LKrgwWM.jpg"
    #New-PatchworkSource -Target "Patchwork.50mm.P0" -Author "eigenVector" -Source "D:\Backups\Camera\Astrophotography\50mm\Andromeda to Orion\P0.Mirach.21x240s.DBE.BN.CC.PCC.NR.Processed.jpg"
    New-PatchworkSource -Target "Patchwork.50mm.P3" -Author "eigenVector" -Source "D:\Backups\Camera\Astrophotography\50mm\Andromeda to Orion\P3.Crop.DBE.BN.CC.PCC.NR.Processed.jpg"
    #New-PatchworkSource -Target "M45" -Author "hinterlufer" -Source "https://i.redd.it/1wmj3n567n241.jpg"
    #New-PatchworkSource -Target "M45" -Author "The_8_Bit_Zombie" -Source "https://i.imgur.com/ZDwkBKy.jpg"
    #New-PatchworkSource -Target "California" -Author "OrangeLantern" -Source "https://i.imgur.com/wyvrrlO.jpg"
    #New-PatchworkSource -Target "Rosette" -Author "OkeWoke" -Source "https://i.redd.it/sa5wby5y6s741.jpg"
    #New-PatchworkSource -Target "FlamingStar" -Author "OrangeLantern" -Source "https://i.redd.it/rlzp1uyolkc41.jpg"
    #New-PatchworkSource -Target "Jellyfish" -Author "Machinza" -Source "https://imgur.com/gallery/BXuRj3W" -- Error
    #New-PatchworkSource -Target "M1" -Author "Lefty" -Source "https://c1.staticflickr.com/5/4828/30952706717_20b763b7f9_o.png"
    #New-PatchworkSource -Target "Patchwork.50mm.P9" -Author "eigenVector" -Source "D:\Backups\Camera\Astrophotography\50mm\Andromeda to Orion\P9.M34.16x240s.Crop.DBE.BN.CC.NR.Processed.jpg"
    #New-PatchworkSource -Target "M31" -Author "usernaneisalreadytak" -Source "https://i.redd.it/p68p3ou3gwx31.jpg"
    #New-PatchworkSource -Target "M31" -Author "hotspicybonr" -Source "https://i.redd.it/9y4m55s7df241.png"
    #New-PatchworkSource -Target "M35" -Author "Lefty" -Source "https://live.staticflickr.com/65535/49124817851_34aaa77130_o.png"
    #New-PatchworkSource -Target "M36" -Author "Lefty" -Source "https://live.staticflickr.com/65535/49146907963_6154c8cd55_o.png"
    #New-PatchworkSource -Target "M37" -Author "Lefty" -Source "https://live.staticflickr.com/65535/49166957357_383a9cab1c_o.png"
    #New-PatchworkSource -Target "M38" -Author "Lefty" -Source "https://live.staticflickr.com/65535/49016062893_a73187eacd_o.png"
    #New-PatchworkSource -Target "" -Author "" -Source ""
    #New-PatchworkSource -Target "" -Author "" -Source ""
)
foreach($i in $sources)
{
    $imageList = new-object System.Collections.Generic.List[Microsoft.DeepZoomTools.Image]
    $imageList.Add(
        (new-object Microsoft.DeepZoomTools.Image ($i.Source)))

    
    try
    {
        $sparse = [Microsoft.DeepZoomTools.SparseImageCreator]::new()
        $sparse.MaxLevel=15
        $sparse.ConversionTileFormat = [Microsoft.DeepZoomTools.ImageFormat]::Png
        $sparse.TileFormat = [Microsoft.DeepZoomTools.ImageFormat]::Png
        $sparse.Create($imageList,"S:\DZI\$($i.Author).$($i.Target).xml")
    }
    catch
    {
        write-warning $_.Exception.ToString()
        throw
    }
}