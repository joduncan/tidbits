#if INTERACTIVE
#r @"System.IO.Compression"
#r @"System.IO.Compression.FileSystem"
#endif

open System.IO
open System.Net
open System.IO.Compression

//type WallpaperFilenameInZipArchive(wallpaperName, zipName) =
//  member this.wallpaperName = wallpaperName
//  member this.zipName = zipName
//
//  // perhaps not explicitly needed, if not specified I think F# guesses based on
//  // running IComparable.CompareTo, but doesn't hurt to be explicit.
//  override this.Equals(yobj) =
//    match yobj with
//    | :? WallpaperFilenameInZipArchive as y -> this.wallpaperName = y.wallpaperName
//    | _ -> false
//
//  override this.GetHashCode() = wallpaperName.GetHashCode()
//
//  interface System.IComparable with
//    member x.CompareTo yobj =
//      match yobj with
//      | :? WallpaperFilenameInZipArchive as y -> compare x.wallpaperName y.wallpaperName
//      | _ -> invalidArg "yobj" "cannot compare values of different types"

// List the contents of multiple zip archives in one pass.
//
// Eg. ListAll @"C:\Data\Corpora\GoogleNGrams\Compressed"
//
let getZipFiles sourceDir = Directory.EnumerateFiles(sourceDir, "*.zip")

//let ListAll sourceDir =
//    Directory.EnumerateFiles(sourceDir, "*.zip")
//    |> Seq.iter (fun zipPath -> printfn "Listing %s" (Path.GetFileName(zipPath))
//                                let archive = ZipFile.Open(zipPath, ZipArchiveMode.Read)
//                                archive.Entries |> Seq.iter (fun entry -> printfn "Entry: %s/%s" entry.Name entry.FullName))

//ListAll @"E:\wallpapers\archives"

let getZipEntries aZipFile =
  let archive = ZipFile.Open(aZipFile, ZipArchiveMode.Read)
  archive.Entries |> Seq.map (fun entry -> [entry.FullName; aZipFile])

//let archives = [@"E:\wallpapers\archives\Abstract Wallpapers - Imgur.zip";
//                @"E:\wallpapers\archives\My Blue Themed Wallpapers - Imgur.zip";
//                @"E:\wallpapers\archives\My Red-Orange-Yellow Themed Wallpapers - Imgur.zip"]

//printfn "entries: %A" allEntries

//archives |> Seq.iter (fun archive ->
//                        let entries = GetZipEntries archive
//                        printfn "%d in %s" (Seq.length entries) (Path.GetFileName archive))
//
//Seq.length allEntries |> printfn "# of entries: %d"

//let sameFile fileName archivePair =
//  fileName == archivePair.[0]

let rec buildZipMapRec (wallpaperZipPairs: list<string list>) zipMap =
  match wallpaperZipPairs with
  | [] -> zipMap
  | first::rest ->
    match Map.containsKey first.[0] zipMap with
    | false -> // key is not in keys, add it
      buildZipMapRec rest (Map.add first.[0] [| first.[1] |] zipMap)
    | true ->
      // key already exists in map, append this zip file to the existing list of
      // zipfiles containing this wallpaper name.
      buildZipMapRec rest (Map.add first.[0] (Array.append zipMap.[first.[0]] [|first.[0]|]) zipMap)

let buildZipMap wallpaperZipPairs =
  buildZipMapRec wallpaperZipPairs (Map.empty<string, string []>)

let archives = getZipFiles @"E:\wallpapers\archives"
// allEntries has all the [wallpaper; zipfile] pairs
let allEntries = archives |> Seq.collect getZipEntries |> Seq.toList
let nameLists = buildZipMap allEntries
printfn "total entries: %d" nameLists.Count
// so now, ideally, we have a mapping of wallpaper name to zip filename(or filenames)
// need to filter on kv pairs that have more than one zip filename.
let dupes = Map.filter (fun key value -> (Array.length value) > 1) nameLists
match Map.isEmpty dupes with
| true -> printfn "No dupes found"
| false -> dupes |> Map.iter (fun key value -> printfn "%s found in:\r\n%A" key value)
