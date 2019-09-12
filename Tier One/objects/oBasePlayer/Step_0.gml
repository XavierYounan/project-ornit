
/* PSUDO CODE
"from state" <- state after last user command acknowledged by the server;

"command" <- first command after last user command acknowledged by server;

while (true)
{
	run "command" on "from state" to generate "to state";
	if (this was the most up to date "command")
		break;

	"from state" = "to state";
	"command" = next "command";
};

*/