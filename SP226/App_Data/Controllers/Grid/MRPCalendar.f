<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
]>

<grid table="vmdmlichlv" code="ngay_nghi" order="ngay_nghi" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục ngày nghỉ" e="Nonworking Calendar"></title>
  <subTitle v="Cập nhật ngày nghỉ: thêm, sửa, xóa..." e="Add, Edit, Delete Nonworking..."></subTitle>

  <fields>
    <field name="form_name%l" width="100" allowSorting="true" external="true" allowFilter="true">
      <header v="Thứ" e="Day"></header>
    </field>
    <field name="ngay_nghi" isPrimaryKey="true" width="100" type="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="dien_giai" width="300" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="form_name%l"/>
      <field name="ngay_nghi"/>
      <field name="dien_giai"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcC8XgBbwETrK2pI/3S2+Z8cW8+2nCpzwK5QjjLSHJZ9/DsFr/DpxbJcvecwJjdmo248oWEIMEuxLB5gfbbrbZJE=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGir7sxAuKfCsd3CI/tRsNU0osH2TjVDdtRaMveCkdSJunNE9/k0UNTgh72APa3pTktO+yNc5qiXZSFLnM2wKLQ=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtfgFEHczBwEWRmXLwwszFaFgwmq+HUx+V5NGhQ5YfFXjS8cbq6rmyzhYSZDHjy1I0A2ZJzGOdpcqfJk0lAlNVUWcV7bisgz556embX4kki334aNzo0qMjvF1OjFATiSKWTuO55SKTGiqCWF1yisdLRMQjwwgkqQBRTSAzf12BcPnJrx3L43fw4/iym000GcF5Ge/u2zvXy/hA9oR+IX8vvtECrnCHorZICE/WQd+8GKHaaMoHWmieSJvyBbupTGevVAQDCQOsb+UH8QZBJLIxyqyAJhbli97EnZnSag0l4kd2iIJdD1bijqG0nM8xEH6NfuHi14quZAO5m5QVJPgaQDLdYjyOvEKOCiRGz4MCslt6gwZw3UX9yDvxAJpHXWIk8i3FfKsKuu821UIzQxwY37c6ocTwgkXQ2/BkKH0VbgdVQ7UKhbqOQiC+t/gOHc5rgA8ahyywW8NLqyT5kkx6BWmKjfFL9MZE8APHlvJFhPHZJrtnrNy8j4gM73fWNHV/SHVWHPPHo6fxQnzb+0PzUQPA3ASnSi3z7/oaOSLQQrxNO3HqI4spnxgoo7gPHkViMMhKb7tPZB2lTVP0mX+MEzQlHGWYh3Piyb3y3qzbWOZKHlCy5pKOHIJbmybcV+bGkHGWwM6ZW4pCJjPZ4vm5cZpjGtvEe1r5VsRym2LBYCRry2NueYhfApLUYESw3P5J4V1FBk5zMvTbVT5sZNIt30M2j9KVcmyvKl4ysNyPY/c</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="ConvertData">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XSnPm3bnc0kqZ7lp6vPaTV/7brLQp7gsQfQCceUiZjuoLGlf+9b7aua/4eC0KdkrHFBg+Zm/5Gap3SpE++HCML+fB9TM8RmgWyn12aCreiD</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6HxhnS8rGXsILZQU7MG6tihTqkxU1cqCt+DhMnIAxvtuQ+N4njb0Oj78FsWbACiwY0eFsvcoRfLaSehrnSJgbkIAQSVKA6ah7hwOjDube6qObJAf/ipQmn2zLxe8y7RBgoxX3dKhTEmcdZ3AEd4npcDb5mIK81DdOh89VssIeq206B1i0gKr+W/oHIjYEEFbQQwttKm8YOWHKVrJOiuNKS0wshkTuPBOJmmlFw92hKxxpoW+gmFshN2GXikDAccmA==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>

    <button command="--">
      <title v="-" e="-"/>
    </button>

    <button command="Generate">
      <title v="Tạo ngày nghỉ tự động$$75" e="Auto Generate Nonworking Day$$75"></title>
    </button>
    <button command="Convert">
      <title v="Lấy ngày nghỉ theo năm trước$$75" e="Convert Data from Last Year$$75"></title>
    </button>

    <button command="--">
      <title v="-" e="-"/>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>