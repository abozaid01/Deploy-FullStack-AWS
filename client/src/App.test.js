import { render, screen } from "@testing-library/react";
import App from "./App";

test("renders a list of notes fetched from the API", async () => {
    // Mock the API response
    const mockResponse = {
        data: [
            { id: 1, title: "Note 1", content: "This is the first note" },
            { id: 2, title: "Note 2", content: "This is the second note" },
        ],
    };
    jest.spyOn(global, "fetch").mockResolvedValue({
        json: jest.fn().mockResolvedValue(mockResponse),
    });

    // Render the component
    render(<App />);

    // Wait for the notes to be fetched and displayed
    const notesList = await screen.findByRole("list");

    // Check that the notes are rendered correctly
    expect(notesList).toBeInTheDocument();

    // Restore the original fetch function
    global.fetch.mockRestore();
});
