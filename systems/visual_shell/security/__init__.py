"""
Visual Shell Security Module

Provides security utilities for:
- Path validation and sanitization
- Command injection prevention
- Input validation
- Rate limiting
- CORS configuration
- Error sanitization
- Audit logging
"""

from .security_utils import (
    SecureExecutor,
    PathValidator,
    CommandSanitizer,
    SecurityError,
    secure_path,
    sanitize_filename,
    validate_file_type,
    ALLOWED_BASE_DIRS,
    BLOCKED_EXTENSIONS,
)

from .schema_validator import (
    SchemaValidator,
    WebSocketMessageSchema,
    validate_websocket_message,
)

from .rate_limiter import (
    RateLimiter,
    RateLimitConfig,
    rate_limit,
    get_rate_limiter,
)

from .cors_config import (
    CORSConfig,
    get_cors_config,
    validate_origin,
)

from .error_sanitizer import (
    sanitize_error_message,
    create_safe_error_response,
)

from .audit_logger import (
    AuditLogger,
    AuditEvent,
    log_security_event,
    get_audit_logger,
)

__all__ = [
    # Security utilities
    "SecureExecutor",
    "PathValidator",
    "CommandSanitizer",
    "SecurityError",
    "secure_path",
    "sanitize_filename",
    "validate_file_type",
    "ALLOWED_BASE_DIRS",
    "BLOCKED_EXTENSIONS",
    # Schema validation
    "SchemaValidator",
    "WebSocketMessageSchema",
    "validate_websocket_message",
    # Rate limiting
    "RateLimiter",
    "RateLimitConfig",
    "rate_limit",
    "get_rate_limiter",
    # CORS
    "CORSConfig",
    "get_cors_config",
    "validate_origin",
    # Error handling
    "sanitize_error_message",
    "create_safe_error_response",
    # Audit logging
    "AuditLogger",
    "AuditEvent",
    "log_security_event",
    "get_audit_logger",
]
