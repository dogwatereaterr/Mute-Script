require('dotenv').config();
process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0';
const cat = require('nekos.life');
const {
	Client,
	GatewayIntentBits,
	EmbedBuilder,
	ButtonBuilder,
	ButtonStyle,
	ActionRowBuilder,
	ComponentType,
} = require('discord.js');

const neko = new cat();

const client = new Client({
	intents: [
		GatewayIntentBits.Guilds,
		GatewayIntentBits.GuildMembers,
		GatewayIntentBits.GuildMessages,
		GatewayIntentBits.MessageContent,
	],
});

client.on('ready', (c) => {
	console.log(`✅ ${c.user.tag} is online.`);
});

function print(text) {
	console.log(text);
}

client.on('interactionCreate', async (interaction) => {
	if (!interaction.isChatInputCommand()) return;

	if (interaction.commandName === 'ping') {
		interaction.reply('Pong!');
	}

	if (interaction.commandName === 'ship') {
		const user = interaction.options.getUser('user1');
		const user2 = interaction.options.getUser('user2');
		let probability = Math.floor(Math.random()*100);
		if (user.id == "969754059202494534" || user2.id == "969754059202494534") {
			probability = 0;
		};
		const embed = new EmbedBuilder()
			.setTitle(`Shipped ${user.username} and ${user2.username}!`)
		  .setDescription(`**<@${user.id}>** and **<@${user2.id}>** are **${probability}%** compatible!`)
			.setColor(0x9A2389);
		
		interaction.reply({ embeds: [embed] });
	};

	if (interaction.commandName === 'help') {
		const embed = new EmbedBuilder()
			.setTitle('Help')
			.setDescription('This is a list of commands:')
			.addFields(
				{ name: '/ping', value: 'Replies with Pong!' },
				{ name: '/ship', value: 'Ships two users together!' },
				{ name: '/help', value: 'Shows a list of commands' },
				{ name: '/anime', value: 'Generates pictures of anime girls' },
			);
		
		interaction.reply({embeds: [embed]})
	};

	if (interaction.commandName === 'anime') {
		const type = interaction.options.get('type').value;
		let waifu;
		
		const pin = new ButtonBuilder()
		.setCustomId("pin")
		.setEmoji("📌")
		.setStyle(ButtonStyle.Secondary);

		const smash = new ButtonBuilder()
		.setCustomId("smash")
		.setLabel("Smash")
		.setStyle(ButtonStyle.Success);

		const pass = new ButtonBuilder()
		.setCustomId("pass")
		.setLabel("Pass")
		.setStyle(ButtonStyle.Danger);

		const child = new ButtonBuilder()
		.setCustomId("child")
		.setLabel("Child")
		.setStyle(ButtonStyle.Danger);

		const row = new ActionRowBuilder()
		.addComponents(pin, smash, pass, child);

		const animegirl = waifucheck(type);

		animegirl.then(async function(result) {
			await interaction.reply({content: result.url, components: [row], fetchReply: true})
			const reply = await interaction.fetchReply();
		});
	};
});

const collector = reply.createMessageComponentCollector({componentType: ComponentType.Button, time: 150000000000000000000000});

collector.on('collect', async i => {
	if (i.customId === "pin") {
		reply.pin()
		await i.reply(`Pinned by <@${i.user.id}>`)
	}
});

collector.on('collect', async i => {
	if (i.customId === "child") {
		await i.reply(`<@${i.user.id}> thinks it's a child`)
	}
});

collector.on('collect', async i => {
	if (i.customId === "Pass") {
		await i.reply(`Passed by <@${i.user.id}>`)
	}
});

collector.on('collect', async i => {
	if (i.customId === "smash") {
		await i.reply(`<@${i.user.id}> would smash`)
	}
});

async function waifucheck(type) {
	if (type == "waifu") {
		const waifu = await neko.waifu();
		return waifu;
	}

	if (type == "fox") {
		const waifu = await neko.foxGirl();
		return waifu;
	}

	if (type == "neko") {
		const waifu = await neko.neko();
		return waifu;
	}
}

client.login(token);
