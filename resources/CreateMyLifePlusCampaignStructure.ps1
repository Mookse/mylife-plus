# Check current execution policy
$currentPolicy = Get-ExecutionPolicy

# Set execution policy to allow running scripts
if ($currentPolicy -ne 'RemoteSigned') {
    Set-ExecutionPolicy RemoteSigned -Scope Process -Force
}

# Define the base directory for the project as the current directory
$baseDir = (Get-Location).Path

# Create the folder structure
$folders = @(
    "$baseDir/docs",
    "$baseDir/content/articles",
    "$baseDir/content/social_media_posts",
    "$baseDir/content/user_stories",
    "$baseDir/media/images",
    "$baseDir/media/videos",
    "$baseDir/media/graphics",
    "$baseDir/campaign_materials/templates",
    "$baseDir/campaign_materials/prompts",
    "$baseDir/campaign_materials/scripts",
    "$baseDir/analytics/metrics",
    "$baseDir/analytics/reports",
    "$baseDir/collaborations/influencers",
    "$baseDir/collaborations/partnerships",
    "$baseDir/feedback/user_feedback",
    "$baseDir/feedback/board_feedback",
    "$baseDir/resources/guides",
    "$baseDir/resources/FAQs"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Force -Path $folder
}

# Create placeholder files
$files = @(
    "$baseDir/docs/README.md",
    "$baseDir/docs/CONTRIBUTING.md",
    "$baseDir/docs/CAMPAIGN_PLAN.md",
    "$baseDir/content/articles/MyLife_Arts.md",
    "$baseDir/content/social_media_posts/Post_20240601.txt",
    "$baseDir/content/user_stories/User_Story_JohnDoe.md",
    "$baseDir/media/images/LinkedIn_Banner.png",
    "$baseDir/media/videos/Intro_Video.mp4",
    "$baseDir/media/graphics/Infographic1.png",
    "$baseDir/campaign_materials/templates/Social_Media_Template.md",
    "$baseDir/campaign_materials/prompts/MyLife_Travel_Prompts.txt",
    "$baseDir/campaign_materials/scripts/Webinar_Script.md",
    "$baseDir/analytics/metrics/LinkedIn_Engagement_202406.csv",
    "$baseDir/analytics/reports/June2024_Report.md",
    "$baseDir/collaborations/influencers/Influencer_List.md",
    "$baseDir/collaborations/partnerships/Partner_Ideas.md",
    "$baseDir/feedback/user_feedback/Feedback_Summary.md",
    "$baseDir/feedback/board_feedback/Board_Feedback_202406.md",
	"$baseDir/resources/resource-links.md",
    "$baseDir/resources/guides/MyLife_Feature_Guide.md",
    "$baseDir/resources/FAQs/General_FAQs.md"
)

foreach ($file in $files) {
    New-Item -ItemType File -Force -Path $file
}

Write-Output "Project structure created successfully!"

# Revert the execution policy to its original state
Set-ExecutionPolicy $currentPolicy -Scope Process -Force
