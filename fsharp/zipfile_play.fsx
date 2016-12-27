#if INTERACTIVE
#r @"System.IO.Compression"
#r @"System.IO.Compression.FileSystem"
#endif

open System.IO
open System.Net
open System.IO.Compression

let getZipFiles sourceDir = Directory.EnumerateFiles(sourceDir, "*.zip")

let getZipEntries aZipFile =
  let archive = ZipFile.Open(aZipFile, ZipArchiveMode.Read)
  archive.Entries |> Seq.map (fun entry -> [entry.FullName; aZipFile])

let rec buildZipMapRec (wallpaperZipPairs: list<string list>) zipMap =
  match wallpaperZipPairs with
  | [] -> zipMap
  | first::rest ->
    match Map.containsKey first.[0] zipMap with
    | false ->
      // key is not in keys, add it
      buildZipMapRec rest (Map.add first.[0] [| first.[1] |] zipMap)
    | true ->
      // key already exists in map, append this zip file to the existing list of
      // zipfiles containing this wallpaper name.
      buildZipMapRec rest (Map.add first.[0] (Array.append zipMap.[first.[0]] [|first.[1]|]) zipMap)

let buildZipMap wallpaperZipPairs =
  buildZipMapRec wallpaperZipPairs (Map.empty<string, string []>)

//let archives = getZipFiles @"E:\wallpapers\archives"
let archives = getZipFiles @"/data/duncan/vms/shared/wallpapers/archives"

// allEntries should have all the [wallpaper; zipfile] pairs
let allEntries = archives |> Seq.collect getZipEntries |> Seq.toList
let nameLists = buildZipMap allEntries
printfn "total entries: %d" nameLists.Count
// so now, ideally, we have a mapping of wallpaper name to zip filename(or filenames)
// need to filter on kv pairs that have more than one zip filename.
let dupes = Map.filter (fun key value -> (Array.length value) > 1) nameLists
match Map.isEmpty dupes with
| true -> printfn "No dupes found"
//| false -> printfn "number of dupes: %d" (List.length (Map.toList dupes))
| false -> dupes |> Map.iter (fun key value -> printfn "%s found in:\r\n%A" key value)
