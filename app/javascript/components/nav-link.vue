<template>
    <li class="hover:bg-white hover:text-white text-black">
        this is nav link
        <a :href={href}>
            {{label}}
            KJFNSEKFNSLFIK
        </a>
    </li>
</template>

<script>
    console.log("im being imported")

    export default  {
        props: {
            label: String,
            href: String
        }
    }
</script>