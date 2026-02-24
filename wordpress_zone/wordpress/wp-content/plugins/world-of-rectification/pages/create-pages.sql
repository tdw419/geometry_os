-- World of Rectification - WordPress Pages
-- Run this SQL to create the game pages in WordPress
-- Replace wp_ with your actual table prefix if different

-- Create the main game page
INSERT INTO wp_posts (
    post_author, post_date, post_date_gmt, post_content, post_title,
    post_excerpt, post_status, comment_status, ping_status, post_password,
    post_name, to_ping, pinged, post_modified, post_modified_gmt,
    post_content_filtered, post_parent, guid, menu_order, post_type,
    post_mime_type, comment_count
) VALUES (
    1, NOW(), NOW(),
    '<!-- wp:shortcode -->[world_of_rectification]<!-- /wp:shortcode -->

<!-- wp:heading {"level":3} -->
<h3>How It Works</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ol>
<li><strong>Choose Your Path</strong>: Easy mode (obvious choices) or Hard mode (contribute to Geometry OS)</li>
<li><strong>Earn CTRM Points</strong>: Your decisions are scored by the Cognitive Transparent Reasoning Model</li>
<li><strong>Level Up</strong>: Higher CTRM unlocks TMS access levels</li>
<li><strong>Release Sparks</strong>: Complete quests to release sparks and restore the world</li>
</ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3>TMS Access Levels</h3>
<!-- /wp:heading -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Level</th><th>CTRM Required</th><th>Unlocks</th></tr></thead><tbody><tr><td>Visitor</td><td>0</td><td>View only</td></tr><tr><td>Player</td><td>100</td><td>Save progress, earn credits</td></tr><tr><td>Contributor</td><td>250</td><td>Submit to Geometry OS</td></tr><tr><td>TMS Member</td><td>500</td><td>Full Truth Management access</td></tr><tr><td>GEMS Manager</td><td>1000</td><td>Local node operator</td></tr><tr><td>Oracle</td><td>2500</td><td>GEMS system eligible</td></tr></tbody></table></figure>
<!-- /wp:table -->',
    'World of Rectification', '', 'publish', 'closed', 'closed', '', 'world-of-rectification', '', '', NOW(), NOW(), '', 0, '', 0, 'page', '', 0
);

-- Create the dashboard page
INSERT INTO wp_posts (
    post_author, post_date, post_date_gmt, post_content, post_title,
    post_excerpt, post_status, comment_status, ping_status, post_password,
    post_name, to_ping, pinged, post_modified, post_modified_gmt,
    post_content_filtered, post_parent, guid, menu_order, post_type,
    post_mime_type, comment_count
) VALUES (
    1, NOW(), NOW(),
    '<!-- wp:shortcode -->[wor_dashboard]<!-- /wp:shortcode -->

<!-- wp:heading {"level":2} -->
<h2>Quick Actions</h2>
<!-- /wp:heading -->

<!-- wp:buttons -->
<div class="wp-block-buttons">
<!-- wp:button -->
<div class="wp-block-button"><a class="wp-block-button__link" href="/world-of-rectification">Play Game</a></div>
<!-- /wp:button -->
</div>
<!-- /wp:buttons -->',
    'Your Dashboard', '', 'publish', 'closed', 'closed', '', 'wor-dashboard', '', '', NOW(), NOW(), '', 0, '', 0, 'page', '', 0
);

-- Verify pages were created
SELECT ID, post_title, post_name, post_status FROM wp_posts WHERE post_name IN ('world-of-rectification', 'wor-dashboard');
