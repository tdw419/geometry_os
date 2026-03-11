# Accessibility Usability Testing Guide

## Visual Shell Keyboard Navigation and Screen Reader Compatibility

This guide provides a comprehensive framework for conducting usability tests with participants who require assistive technologies.

---

## Table of Contents

1. [Testing Objectives](#testing-objectives)
2. [Participant Recruitment](#participant-recruitment)
3. [Test Environment Setup](#test-environment-setup)
4. [Test Scenarios](#test-scenarios)
5. [Evaluation Criteria](#evaluation-criteria)
6. [Data Collection](#data-collection)
7. [Reporting](#reporting)

---

## Testing Objectives

### Primary Objectives

1. **Keyboard Navigation**: Verify all functionality is accessible via keyboard alone
2. **Screen Reader Compatibility**: Ensure all content is perceivable and understandable
3. **Focus Management**: Confirm focus indicators are visible and logical
4. **Error Handling**: Test that errors are properly announced and recoverable
5. **Efficiency**: Measure task completion time and error rates

### Success Criteria

- 100% of tasks completable with keyboard only
- Screen reader users can understand all content on first hearing
- Focus order follows logical reading sequence
- All interactive elements have accessible names
- Error recovery takes < 30 seconds on average

---

## Participant Recruitment

### Target Participant Profiles

Recruit participants from each of the following categories:

#### Profile A: Keyboard-Only Users
- **Characteristics**: Does not use a mouse, relies entirely on keyboard
- **N=3-5 participants**
- **Recruitment sources**: 
  - Local disability organizations
  - Online accessibility communities
  - Professional networks

#### Profile B: Screen Reader Users
- **Characteristics**: Uses screen reader (NVDA, JAWS, VoiceOver, etc.)
- **N=3-5 participants per screen reader**
- **Recruitment sources**:
  - National Federation of the Blind
  - American Foundation for the Blind
  - Screen reader user forums

#### Profile C: Switch/Alternative Input Users
- **Characteristics**: Uses switch devices, voice control, or other alternative inputs
- **N=2-3 participants**
- **Recruitment sources**:
  - Assistive technology centers
  - Rehabilitation centers
  - ALS/Motor neuron disease support groups

#### Profile D: Low Vision Users
- **Characteristics**: Uses screen magnification, high contrast modes
- **N=2-3 participants**
- **Recruitment sources**:
  - Low vision clinics
  - Macular degeneration support groups

### Screening Questions

1. What assistive technologies do you use regularly?
2. How long have you been using this technology?
3. What is your comfort level with web applications?
4. Are you able to participate in a 60-90 minute session?

---

## Test Environment Setup

### Hardware Requirements

- [ ] Quiet testing room
- [ ] Computer with Windows 10/11 or macOS
- [ ] External monitor (minimum 24")
- [ ] Participants' own assistive technology devices (preferred)
- [ ] High-quality microphone for recording
- [ ] Screen capture software (with AT audio capture)

### Software Requirements

- [ ] NVDA (latest version)
- [ ] JAWS (latest version)
- [ ] VoiceOver (built into macOS)
- [ ] ZoomText or MAGic (for low vision)
- [ ] Dragon NaturallySpeaking (for voice control)
- [ ] Chrome, Firefox, Safari (latest versions)

### Visual Shell Configuration

```javascript
// Enable accessibility debug mode
window.a11y = new EnhancedAccessibilityManager({
    debugMode: true,
    announceChanges: true
});
```

### Pre-Test Checklist

- [ ] All assistive technologies are installed and configured
- [ ] Test scenarios are loaded and ready
- [ ] Recording equipment is tested
- [ ] Consent forms are prepared
- [ ] Note-taking materials are ready
- [ ] Backup testing device is available

---

## Test Scenarios

### Scenario 1: Basic Navigation

**Objective**: Verify users can navigate the main interface

**Task**: Navigate from the header to the main content area, then to the tile grid.

**Steps**:
1. Start at the top of the page
2. Use skip links to jump to main content
3. Navigate to the tile grid
4. Move through at least 4 tiles using arrow keys
5. Return to the top of the page

**Success Criteria**:
- Skip links are discovered and used
- Focus moves logically through content
- Grid navigation works with arrow keys
- Current position is announced

**Questions for participant**:
- Was it clear how to skip to main content?
- Were the navigation announcements helpful?
- Did anything unexpected happen?

### Scenario 2: Tile Interaction

**Objective**: Verify tile selection and activation

**Task**: Select and interact with tiles in the grid

**Steps**:
1. Navigate to the tile grid
2. Select tile number 7
3. Activate the tile (Enter key)
4. Navigate to tile number 3
5. Activate that tile
6. Return focus to the grid container

**Success Criteria**:
- Tiles can be selected with arrow keys
- Current tile position is announced
- Tile activation is announced
- Selection state is clear

**Questions for participant**:
- Could you tell which tile was currently focused?
- Was the selection feedback clear?
- How would you improve the tile announcements?

### Scenario 3: Tab Panel Navigation

**Objective**: Verify tab interface is accessible

**Task**: Navigate between tabs and access content

**Steps**:
1. Navigate to the tab list
2. Move to the "Details" tab using arrow keys
3. Activate the tab to show its panel
4. Navigate into the tab panel content
5. Return to the tab list
6. Navigate to the "Settings" tab
7. Activate and explore the settings panel

**Success Criteria**:
- Tab list role is announced
- Arrow keys move between tabs
- Tab activation shows correct panel
- Tab panel content is accessible

**Questions for participant**:
- Were you aware of how many tabs were available?
- Was it clear which tab was currently selected?
- Could you easily access the tab panel content?

### Scenario 4: Form Completion

**Objective**: Verify form accessibility

**Task**: Complete and submit a form

**Steps**:
1. Navigate to the form
2. Fill in the "Name" field with "Test User"
3. Navigate to the "Email" field
4. Enter an invalid email (missing @)
5. Attempt to submit
6. Note any error messages
7. Correct the email to "test@example.com"
8. Fill in the message field
9. Submit the form

**Success Criteria**:
- Form fields are properly labeled
- Required fields are indicated
- Error messages are announced
- Form can be completed with keyboard only

**Questions for participant**:
- Were all form fields clearly labeled?
- How were errors communicated to you?
- Was the form submission confirmation clear?

### Scenario 5: List Navigation

**Objective**: Verify list/listbox accessibility

**Task**: Navigate and select from a list of peers

**Steps**:
1. Navigate to the peer list
2. Move through the list items using arrow keys
3. Select "node-gamma-03"
4. Verify selection is announced
5. Move to the last item in the list
6. Return to the first item using Home key

**Success Criteria**:
- List role is announced
- Arrow keys navigate list items
- Selection is announced
- Home/End keys work correctly

**Questions for participant**:
- Could you tell how many items were in the list?
- Was it clear when you reached the end of the list?
- Was the selected item clearly indicated?

### Scenario 6: High Contrast Mode

**Objective**: Verify high contrast mode compatibility

**Task**: Enable high contrast mode and verify usability

**Steps**:
1. Press "h" to enable high contrast mode
2. Navigate through the main interface
3. Verify all text is readable
4. Verify focus indicators are visible
5. Verify interactive elements are distinguishable
6. Disable high contrast mode

**Success Criteria**:
- High contrast mode can be toggled
- All text remains readable
- Focus indicators are visible
- Interactive elements are distinguishable

**Questions for participant**:
- Were all elements visible in high contrast mode?
- Were focus indicators clear?
- Was there anything difficult to see?

### Scenario 7: Error Recovery

**Objective**: Verify error handling and recovery

**Task**: Trigger and recover from error states

**Steps**:
1. Navigate to a form field
2. Enter invalid data
3. Attempt to submit
4. Note error message announcement
5. Navigate to the error message
6. Correct the error
7. Verify correction is acknowledged

**Success Criteria**:
- Errors are announced immediately
- Error messages are descriptive
- User can navigate to error location
- Correction path is clear

**Questions for participant**:
- How were errors announced to you?
- Were the error messages helpful?
- How easy was it to correct the error?

### Scenario 8: Dynamic Content Updates

**Objective**: Verify live region announcements

**Task**: Trigger and verify dynamic content updates

**Steps**:
1. Navigate to the live region demo
2. Click "Polite Announcement" button
3. Wait for announcement
4. Click "Assertive Announcement" button
5. Note the difference in announcement timing
6. Click "Status Update" button
7. Verify status is announced

**Success Criteria**:
- Polite announcements are queued properly
- Assertive announcements interrupt
- Status updates are clear
- User is aware of content changes

**Questions for participant**:
- Did you hear all the announcements?
- Was there a difference between polite and assertive?
- Were any announcements missed or unclear?

---

## Evaluation Criteria

### WCAG 2.1 Success Criteria (Level AA)

| Criterion | Description | Pass/Fail | Notes |
|-----------|-------------|-----------|-------|
| 1.1.1 | Non-text Content | | |
| 1.3.1 | Info and Relationships | | |
| 1.3.2 | Meaningful Sequence | | |
| 1.4.3 | Contrast (Minimum) | | |
| 1.4.11 | Non-text Contrast | | |
| 2.1.1 | Keyboard | | |
| 2.1.2 | No Keyboard Trap | | |
| 2.4.1 | Bypass Blocks | | |
| 2.4.3 | Focus Order | | |
| 2.4.4 | Link Purpose | | |
| 2.4.5 | Multiple Ways | | |
| 2.4.6 | Headings and Labels | | |
| 2.4.7 | Focus Visible | | |
| 3.2.1 | On Focus | | |
| 3.2.2 | On Input | | |
| 3.3.1 | Error Identification | | |
| 3.3.2 | Labels or Instructions | | |
| 4.1.2 | Name, Role, Value | | |
| 4.1.3 | Status Messages | | |

### Usability Metrics

| Metric | Target | Actual | Notes |
|--------|--------|--------|-------|
| Task Success Rate | > 95% | | |
| Average Task Time | < 30s | | |
| Error Rate | < 5% | | |
| Help Requests | < 2/task | | |
| Satisfaction (SUS) | > 70 | | |

---

## Data Collection

### Quantitative Data

For each task, record:

1. **Task Completion**: Yes/No/Partial
2. **Time on Task**: Seconds
3. **Number of Errors**: Count
4. **Number of Help Requests**: Count
5. **Keyboard Keystrokes**: Count
6. **Screen Reader Commands**: Count

### Qualitative Data

For each task, note:

1. **Participant Verbalizations**: Direct quotes
2. **Observed Difficulties**: Specific issues
3. **Workarounds Used**: Alternative strategies
4. **Suggestions**: Improvement ideas

### Recording Template

```
Participant ID: ____________
Date: ____________
Assistive Technology: ____________
Experience Level: ____________

SCENARIO: [Scenario Name]

Task Start Time: ____________
Task End Time: ____________
Total Time: ____________

Completion Status: [ ] Completed [ ] Partial [ ] Failed

Errors Observed:
1. ____________
2. ____________

Help Requests:
1. ____________
2. ____________

Participant Quotes:
"____________"

"____________"

Observer Notes:
____________

Post-Task Questions:
Q1: [Question]
A1: [Answer]

Q2: [Question]
A2: [Answer]
```

---

## Reporting

### Executive Summary Template

```markdown
# Visual Shell Accessibility Usability Test Results

## Executive Summary

### Overview
- Number of participants: X
- Assistive technologies tested: [List]
- Date range: [Dates]
- Key findings: [Summary]

### Key Metrics
| Metric | Target | Result | Status |
|--------|--------|--------|--------|
| Task Success Rate | >95% | X% | ✓/✗ |
| Average Task Time | <30s | Xs | ✓/✗ |
| Error Rate | <5% | X% | ✓/✗ |
| SUS Score | >70 | X | ✓/✗ |

### Critical Issues
1. [Issue] - Severity: [Critical/High/Medium/Low]
2. [Issue] - Severity: [Critical/High/Medium/Low]

### Recommendations
1. [Recommendation] - Priority: [High/Medium/Low]
2. [Recommendation] - Priority: [High/Medium/Low]
```

### Issue Report Template

```markdown
## Issue: [Title]

### Description
[Detailed description of the issue]

### Severity
[ ] Critical - Prevents task completion
[ ] High - Significantly impacts usability
[ ] Medium - Causes confusion or delay
[ ] Low - Minor inconvenience

### WCAG Criterion
[Reference to specific WCAG success criterion]

### Impact
- Users affected: [Profile/AT combination]
- Tasks affected: [List of tasks]
- Frequency: [How often it occurs]

### Steps to Reproduce
1. [Step 1]
2. [Step 2]
3. [Step 3]

### Expected Behavior
[What should happen]

### Actual Behavior
[What actually happens]

### Evidence
- Participant IDs: [List]
- Video timestamps: [List]
- Screen captures: [Links]

### Recommendation
[Proposed fix or workaround]

### Priority
[ ] P1 - Fix immediately
[ ] P2 - Fix in next sprint
[ ] P3 - Fix in next release
[ ] P4 - Backlog
```

---

## Appendices

### Appendix A: Consent Form

```
Accessibility Usability Study Consent Form

I, _______________, agree to participate in the Visual Shell 
accessibility usability study conducted by _______________.

I understand that:
1. The session will last approximately 60-90 minutes
2. The session will be audio and video recorded
3. My participation is voluntary
4. I may stop at any time
5. My data will be kept confidential
6. Results will be reported anonymously

Signature: _______________
Date: _______________
```

### Appendix B: Pre-Test Questionnaire

1. What is your age range?
   - [ ] 18-29
   - [ ] 30-49
   - [ ] 50-64
   - [ ] 65+

2. What assistive technology do you use? (Check all that apply)
   - [ ] Screen reader (NVDA, JAWS, VoiceOver, etc.)
   - [ ] Screen magnification
   - [ ] High contrast mode
   - [ ] Voice control
   - [ ] Switch device
   - [ ] Other: ____________

3. How long have you used this technology?
   - [ ] Less than 1 year
   - [ ] 1-3 years
   - [ ] 3-5 years
   - [ ] More than 5 years

4. How often do you use web applications?
   - [ ] Daily
   - [ ] Several times per week
   - [ ] Several times per month
   - [ ] Rarely

### Appendix C: Post-Test Questionnaire (SUS)

1. I think that I would like to use this system frequently
2. I found the system unnecessarily complex
3. I thought the system was easy to use
4. I think that I would need the support of a technical person to be able to use this system
5. I found the various functions in this system were well integrated
6. I thought there was too much inconsistency in this system
7. I would imagine that most people would learn to use this system very quickly
8. I found the system very cumbersome to use
9. I felt very confident using the system
10. I needed to learn a lot of things before I could get going with this system

Scale: 1 (Strongly Disagree) to 5 (Strongly Agree)

### Appendix D: Screen Reader Command Reference

#### NVDA Commands
- `Insert + Space`: Toggle focus/browse mode
- `Insert + F7`: Elements list
- `H`: Next heading
- `Tab`: Next focusable element
- `Arrow keys`: Navigate by line/character

#### JAWS Commands
- `Insert + Z`: Toggle virtual cursor
- `Insert + F6`: Headings list
- `H`: Next heading
- `Tab`: Next focusable element
- `Arrow keys`: Navigate by line/character

#### VoiceOver Commands
- `Control + Option + A`: Read all
- `Control + Option + U`: Rotor
- `Control + Option + H`: Next heading
- `Tab`: Next focusable element
- `Control + Option + Arrow keys`: Navigate

---

## Contact

For questions about this testing protocol:

- **Email**: accessibility@geometry-os.example
- **Slack**: #accessibility-testing

---

*Document Version: 1.0*
*Last Updated: 2026-03-11*
