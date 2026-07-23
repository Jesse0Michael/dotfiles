# Go Coding Guidelines

## Error Handling

- Wrap errors with context: `fmt.Errorf("failed to do x: %w", err)`

```go
if err != nil {
    return fmt.Errorf("failed to create client: %w", err)
}
```

## Logging

- Use structured logging with the `slog` package. 
- Always use the `"err"` attribute for errors:

```go
slog.InfoContext(ctx, "processing request", "user_id", userID)
slog.ErrorContext(ctx, "failed to create client", "err", err)
```

## Comments

- Comment on complex business logic explaining the "why", Comments explain "why", not "what"
- Document interfaces with brief method descriptions
- Use helpful godoc comments for exported functions/types
- Avoid comments that repeat what the code does
- Avoid excessive inline comments for basic operations
- No commented-out code — use version control instead

## Testing Conventions

- **Table-driven tests** with multiple test scenarios 
- Use `t.Context()` for context in tests
- for mocking use `gomock` and a `mockSetup` test case function
- For static values with test identifiers use `test-{type}` or `test-{type}-{index}` (e.g., `test-user`, `test-user-1`)
- Test fixtures in `testdata/` directories, loaded via `test.LoadFile` / `test.LoadJSONFile`
- For function test cases, set the function in every test case instead of checking if the value is nil.
- Compare full expected values, not individual fields. Use `reflect.DeepEqual` or `go-cmp` to compare structs in one assertion rather than checking fields one by one.
- Use exact expected response bodies in HTTP handler tests rather than substring matching.
- Use deterministic test setups (e.g. `uuid.SetRand`, `synctest.Test`) so expected values can be hardcoded.

```go
func TestService_DoSomething(t *testing.T) {
    tests := []struct {
        name      string
        input     string
        mockSetup func(mockClient *mock.MockClient)
        expected  string
        wantError bool
    }{
        // Test cases
    }
    for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) {
            ctrl := gomock.NewController(t)
            defer ctrl.Finish()
            mockClient := mock.NewMockClient(ctrl)
            tt.mockSetup(mockClient)

            s := TestService{
                client: mockClient,
            }

            result, err := s.DoSomething(t.Context(), tt.input)

            require.Equal(t, tt.expected, result)
            require.Equal(t, tt.wantError, err != nil)
        })
    }
}
```

## Building

- build go binaries in the root bin directory

## Post-Write Validation

After writing or editing `.go` files:
1. Run `goimports -w` on each changed file to fix formatting and imports
2. Run `golangci-lint run --fix` on only the changed files 
