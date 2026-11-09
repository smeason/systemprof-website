param(
    [int]$Port = 8080
)

$siteRoot = (Resolve-Path $PSScriptRoot).Path
$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add("http://localhost:$Port/")
$listener.Start()

Write-Host "Serving $siteRoot at http://localhost:$Port/"
Write-Host "Press Ctrl+C to stop."

$mimeTypes = @{
    ".css" = "text/css; charset=utf-8"
    ".html" = "text/html; charset=utf-8"
    ".shtml" = "text/html; charset=utf-8"
    ".js" = "text/javascript; charset=utf-8"
    ".json" = "application/json; charset=utf-8"
    ".mp4" = "video/mp4"
    ".pdf" = "application/pdf"
    ".png" = "image/png"
    ".jpg" = "image/jpeg"
    ".jpeg" = "image/jpeg"
    ".webp" = "image/webp"
    ".ico" = "image/x-icon"
}

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $relativePath = [Uri]::UnescapeDataString($context.Request.Url.AbsolutePath.TrimStart('/'))
        if ([string]::IsNullOrWhiteSpace($relativePath)) { $relativePath = 'index.html' }

        $filePath = [IO.Path]::GetFullPath((Join-Path $siteRoot $relativePath))
        if (-not $filePath.StartsWith($siteRoot, [StringComparison]::OrdinalIgnoreCase) -or -not (Test-Path -LiteralPath $filePath -PathType Leaf)) {
            $context.Response.StatusCode = 404
            $context.Response.Close()
            continue
        }

        $extension = [IO.Path]::GetExtension($filePath).ToLowerInvariant()
        $context.Response.ContentType = $mimeTypes[$extension]
        if (-not $context.Response.ContentType) { $context.Response.ContentType = 'application/octet-stream' }

        $bytes = [IO.File]::ReadAllBytes($filePath)
        try {
            $context.Response.ContentLength64 = $bytes.Length
            $context.Response.OutputStream.Write($bytes, 0, $bytes.Length)
        }
        catch {
            # Browsers can cancel a PDF request while switching tabs or using their
            # built-in viewer. The server should continue serving later requests.
        }
        finally {
            $context.Response.Close()
        }
    }
}
finally {
    $listener.Close()
}
