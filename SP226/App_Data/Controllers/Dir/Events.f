<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY EventsScript SYSTEM "..\Include\Javascript\EventsScript.txt">
  <!ENTITY EventsEmail SYSTEM "..\Include\Command\EventsEmailCommand.txt">
]>

<dir table="sysevents" code="id" order="id" xmlns="urn:schemas-fast-com:data-dir">
  <title v="công việc/sự kiện" e="Task/Event"></title>
  <fields>
    <field name="id" isPrimaryKey="true" type="Decimal" disabled="true" hidden="true" inactivate="true">
      <items style="Numeric"></items>
    </field>
    <field name="event_yn" type="Decimal" dataFormatString="0, 1" clientDefault="0" defaultValue="0" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="0 - Công việc, 1 - Sự kiện" e="0 - Task, 1 - Event"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99H1Jhc5Ptu84GiakQqIGp8WhtgaHMB9jW24u5qZFBJ7J</Encrypted>]]></clientScript>
    </field>
    <field name="text" allowNulls="false">
      <header v="Tên" e="Name"></header>
    </field>
    <field name="assigned_name" dataFormatString="X" allowContain="true">
      <header v="Người nhận" e="Assigned to"></header>
      <items style="Lookup" controller="PrivateUser" reference="assigned_comment" information="name$vsysuserinfo.comment"/>
    </field>
    <field name="assigned_comment" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="muc_do" clientDefault="2">
      <header v="Mức độ ưu tiên" e="Priority"></header>
      <items style="DropDownList">
        <item value="1">
          <text v="Cao" e="High"/>
        </item>
        <item value="2">
          <text v="Bình thường" e="Normal"/>
        </item>
        <item value="3">
          <text v="Thấp" e="Low"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="start_date" type="DateTime" dataFormatString="dd/MM/yyyy" align="left" allowNulls="false" defaultValue="null">
      <header v="Bắt đầu" e="Start"></header>
    </field>
    <field name="start_time" type="String" dataFormatString="HH:mm" align="left" allowNulls="true" external="true" defaultValue="null" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="end_date" type="DateTime" dataFormatString="dd/MM/yyyy" align="left" allowNulls="false" defaultValue="null">
      <header v="Kết thúc" e="End"></header>
    </field>
    <field name="end_time" type="String" dataFormatString="HH:mm" align="left" allowNulls="true" external="true" defaultValue="null" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="full_day" type="Boolean" defaultValue="0">
      <header v="Cả ngày" e="All-Day"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Gr+sUEftnCW9pau4aWq2u9ufZk2pBf8db9b42cN9G/asJ0VsLRI9kGhPb+/U9iQ2w==</Encrypted>]]></clientScript>
    </field>
    <field name="details" rows="4" defaultValue="''">
      <header v="Chi tiết" e="Detail"></header>
    </field>
    <field name="private" type="Boolean">
      <header v="Không chia sẻ" e="Private"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Cf1pr2C6z83PIAZelYaNklhq5r1ZfHC7jnXRgYLOwDUUP4/HUzCJrQrfJq6RAgf8A==</Encrypted>]]></clientScript>
    </field>
    <field name="share_user" dataFormatString="X" defaultValue="''">
      <header v="Chia sẻ cho nsd" e="Share to user(s)"></header>
      <items style="Lookup" controller="UserGroup" key="admin &lt;&gt; 1 and user_yn &lt;&gt; 0 and status = '1' and id &lt;&gt; @@userID" check="admin &lt;&gt; 1 and user_yn &lt;&gt; 0"/>
    </field>
    <field name="share_group" hidden="true" readOnly="true" type="Int32">
      <header v="" e=""></header>
    </field>
    <field name="ma_nhom" dataFormatString="X" external="true" defaultValue="''" allowContain="true">
      <header v="Chia sẻ cho nhóm" e="Share to Group"></header>
      <items style="AutoComplete" controller="PrivateGroup" reference="ten_nhom" key="user_id0 = @@userID" check="user_id0 = @@userID" information="ma_nhom$privategroup.ten_nhom"/>
    </field>
    <field name="ten_nhom" external="true" defaultValue="''" readOnly="true" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="owner" external="true" defaultValue="''" disabled="true" inactivate="true">
      <header v="Người tạo" e="Owner"></header>
    </field>
    <field name="datetime0" type="DateTime" dataFormatString="dd/MM/yyyy HH:mm:ss" external="true" defaultValue="null" disabled="true">
      <header v="Thời gian tạo" e="Datetime"></header>
    </field>
    <field name="status" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="Chưa thực hiện" e="No Action"/>
        </item>
        <item value="1">
          <text v="Đang thực hiện" e="In Progress"/>
        </item>
        <item value="2">
          <text v="Hoàn thành" e="Completed"/>
        </item>
        <item value="3">
          <text v="Tạm dừng" e="Pending"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="type">
      <header v="Chức năng" e="Function"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="Khác" e="Other"/>
        </item>
        <item value="1">
          <text v="Khách hàng" e="Account"/>
        </item>
        <item value="2">
          <text v="Liên hệ" e="Contact"/>
        </item>
        <item value="3">
          <text v="Đầu mối" e="Lead"/>
        </item>
        <item value="4">
          <text v="Cơ hội" e="Opportunity"/>
        </item>
        <item value="5">
          <text v="Phản hồi" e="Case"/>
        </item>
        <item value="6">
          <text v="Chiến dịch" e="Campaign"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 80, 42, 20, 168, 20, 80, 0"/>
      <item value="110000111: [owner].Label, [owner], [private], [private].Label, [type]"/>

      <item value="110000000: [datetime0].Label, [datetime0]"/>
      <item value="111000000: [event_yn].Label, [event_yn], [event_yn].Description"/>
      <item value="110000001: [text].Label, [text], [id]"/>
      <item value="1100: [muc_do].Label, [muc_do]"/>
      <item value="110000000: [assigned_name].Label, [assigned_name]"/>
      <item value="110000000: [share_user].Label, [share_user]"/>
      <item value="110100001: [ma_nhom].Label, [ma_nhom], [ten_nhom], [share_group]"/>
      <item value="110111000: [start_date].Label, [start_date], [start_time],[full_day], [full_day].Label"/>
      <item value="1101: [end_date].Label, [end_date], [end_time]"/>
      <item value="110000000: [details].Label, [details]"/>

      <item value="1100: [status].Label, [status]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8cDa0ufTpxB3KXwQK61z0vxynh1uPyqYwRiclM5wtuUeI/WYQLaH8A6CxnfFUOXV9spsDK1bLFuO6uxXhDF3pFik9Pggzys9BISzEDNDrUEakhfqXvOrLnEcYl8W/Xpy8YxMlVGAKctKRPg2J2VzWaDUmnuCcycERKzi6m3HhhvuQjoQt02AAmyw0AdmJJieTwMcv1Ig//KuCsKu/gc0Z0u49vOmi4POnM/zmXL2fJ5</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu845EE1GJt/gQDscqNz74DCXpNk4ocKYNy+lsSRKKhrHajIfy6NxUlgC1hkDYHUVZXE8vA7bEQPiQ2LztLYcVY7PYzkqmDJ4P3KZx4CyVt2EHjV6hzNJA/OBUE574CboBfs370+kpUMLZIudq39JY4csOphnN4fiBaUYpzmrCPH+7x8076NS7PwsXvKGR+97jRTFczolJpmu2oPa0jVN4xy8zP7VNivF5j97ZYDMWPOkm10+ZgLIsuDMp57hWzQryvmFGR3nCBOB9XME2fWyGKqmydSZ9SttZNwN2Ax3Ooc7HyEkgM3YyNyFv+qxJKFhujNqpyMjhq2CPgRXKiR0qJmwUvTfNZ+dscAgU/5PseVCxWgbw01clXuzQHByoLCoKjHKTFjlICdSaFuQReF5Q2nCMGoPci4jCOvBarTb5kedbRtx4u1O3O7lzIR2mmEnFVcO8W7v1DYyJ8y6xL0pTAv5QeWbE25NtXvdOgAS/NWB</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu845EE1GJt/gQDscqNz74DDQ9wFH+m9pNXNyobIMiT10uJSjyB/peUIK/U6p34HgflBcDw9nGyW0nueS8PNP70Oli4wkBjIIZqLTcjv0LR23dJY+bl96QyarzQ2vZ37F6NHOmXakGu4BzrdBlpiibwpTFqz6bUAzey/dnsRilaYpTzA1Dg93vQM+bbM9Hg4A6V+D922fwGP7yFLuelY3s/qNMc8doOKIkG2GBP0XW/Ow7AckkFzMOTzM7XlrBLZdZ8L1tJjR6+2W9w734pqUBd8iF74xJLz3MulgmA6zOmHxSYTNlhO5CPY2cJ4XnB+kQBSfyzeLxRmi/+xUk49hjzxO4CSv3cE/Q4sX0q06rUEza9G8t941WBZo2F9c9SP0BJHadEq76wKLdlKFQIQuUAyrRHJajE0wzaf229CV4w+uTsE952E0xmuKDpEt1wcPnGqNIZghMQsvXNqX5mRUD1FTpVHuhWUOe7fC9ZPf4wgfrkOHQ5QePvtNOBs967ANbg==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EUnJ7mU8cvFU1yAvsTkD+TfgBQWcp8NfsS/REKZfXM2UDKvrSwTIUgUwS4C+RY4WM6PNyE/DdSmptrx8A1o2OdiGWHs/2sCieRjJ8idL2jA0RupDpCK3DDLhVHGGWCKLUvKXHgh1rDLlQAwjV6D9AZ+BRkBe2b0hfkXKWd1UpVO2Jh3zDKqVoX4k0OXynHp6ykV+IHS+sY1A0PhQTPhs8l1s6M7eQyCNFB8LUjsYG6WsA5wJw5I0FsIR6fFAeiE4GVpsU5v2/3LxL9n9D/hQpMk2LYQMmvqnfZ4Io/gRhmfaCf09teiTPSiRYaCbATY9Cg==</Encrypted>]]>
      </text>
    </command>


    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPX/jwkee64pWu6AOmfqVLEmn5h6AUyPmmNT3+oaXkdt0SAZX1dvWTxzrObnSFXsYgJFIOb6Ei8rQ1Nfc7EkjHWzR6G9ume8ly29UbWSsOPdxVyy0cvYSF95dyr12ganlx+jsvdg9JD/x6ojnMBOiaMbszfZB9Pgu7QEzX1H+OX5k0UnwFNomGj/O8F7kSERIfz2GTbUw73faLET3ZnOQy5HXz/6R9172CwNRY8JlX7lIy/TIhJIuZPVp2Srd4j8IFlVQLQJEQAbz246XDNAYA7tVWTtqUTWsV2VC7kwsJ7q9mILY2Iil3JuUIkDWdiNW7AYLuz74Y3F7k9SqqphRK1lIj2YK4H76NZw3diYWGxjse8RYHzVWupO18uYs3awFjMevqSc6rQmxFehoImFvrw/oy6afxba0Tbs2kAtyYisHKiVlNwjJ9oOegqapujXkClvVmYV2RF9yXNKE2zzhO6ByxIYT2JNifzgIRejPcD5raybO1HJCU3wl4xkoUEoGJNNZTY1D1SBvwvZo9v1a7BCym++NsoEnbu6AW1qkv1MWuqZA9lyMxQB79bjZneiwbxCUBh9E8dWmOdq/igqyeQ/kuiNH/KUVcmXJzz/qTKz0aVgvbGynRH9NASyiF22bICSt/QMQRuLDvOuBAjBqquew9tg2xRrw2PQBqw/Vgnr</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &EventsEmail;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcF8fMb3M/er0xXcHGB9wLOiC2vZhIRKJT+tdgeROE1yz0BjoQNbluC8Hxbp5HdcRxKB6seLg3MJjky4CVep2f1C5Dm5lICUnhHJdQgSq+A5M5/8yEyIjmBMaatiJaOUTSy8epfVsqm0ImPYyrISzjbOoTqklVA28E9bybGNkorQggvhs7IE/ENjRBxBwLmROyw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6gjce6Tyv1iviAgRGpfDRPYf36P1GVr467BLU2lC2N88B/TB4rYHgBn1mEUFnGpB5Nh9SFIHgxj3DoGUg07rIu1b9QlcbqU3v6AHfl96QYN7HmEdKujrIUHgT5KegJGuejcHwaMjbmulWnmUWl2uV5ujcxotD1dIo7SfNujKu2U+hKmI6D2pJeZkMRfDNQJ7D5hVUnvcvECNBJocTa5owudpgcFHxHivcMkCzpMrPO586HTIyDbpll/DTzYenxfqDBEJCHCoWWG5qVindUbaXW7R/+E5/5lYgeohrAJkG6mZWMkP1ijH5hJrxv0kBMq8fFhPY6drwrRouX8r17Wn33xoa2cXhMkGz4B+x+4XlfsJpLmPgYIiSpgMzaqactrprL0OHuE2/THPYRNt6auqXSNJsr5OQ8aHXJTQJgtbqXsnkgcHLndYR58BYHLRwWjtc/ahq2m/wzBuiaBEYFftEhmp/iX9rmcBKTg8SJ5impGskrp9CGuOFTVxPUDjY7LUpnNWaPs2xNqNT2WaH3DQvHMRHI/dJARqEHCUve147v9Gbb5WyViB96bO1wZXz2zJW6Et+QNzW8y7GchxbHDbNfpxP0x15EYz2X4Zq0zR3B3CMR+8KZK0xkpDLEgW1OjBW0fqBZc/Zrf723s27JQB3YZ0XWWNnzWkYGWDMfbIvSCw/CJ3MlELaiiPdaGbpyL7g==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wPxWsdvfY+LPQtjB/xc7GA6mpEoCX1Vgptiza+2GuweHWGAP/DMprlVeR7kjDnuQ124vvAgWXtb8NiSx+UCaAIpTpGBMLxiYC7i5R6pPL0R6FNSLxukTzK9IW3loX+yDHaa8jmOhUYNQFJI5PdPfYfWtX9HfpiaYTNMeseGYDFLWEobB+Bsr/zXjxLaVr/YGTiPMFNxHnLCHBcunQD9Yrfc5Xb3VV9r/USFeXMZl7Wy97LjnNlJz32O8z+Q97bIPG41Mz5HSLU8yucOFyRETbhgcqf/6XG6soBNQSPEJL5qaDTigvlQ5a07RmvhETJ1C5xbqSMx4azVAzCAQZVcdBKYbLvKEROvbKC5SzzF3S4uMNCgSnUNo8Idj6J+Cs04LDNB1bsxQ3uBWh+XkeqL6BA3cwSeLP2PCHNxefONGoZtQ==</Encrypted>]]>&EventsEmail;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcF8fMb3M/er0xXcHGB9wLOiC2vZhIRKJT+tdgeROE1yzRcvd14yJRL8RZPzbnlrEwPdRimIf1S+VGNpfq+nbyJm8NkWw8vvlU1kPGR2wvJXxqcisL9GGWpv+6yPS3qSZfA==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&0OcHBq554hlKe+RSHmnm06fEY59EqG9tNSWoG7oLEqg=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&3fWeGq8RzWh/NTe1zazZNre/1tYDelZ2lJzSscgBsR8=</Encrypted>]]>
      </text>
    </command>
  </commands>


  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtbktgnp//mMRSgcq9HkgcwGfEIbY7yndgbHf+gmNeuGxGmvsJQQEyAaTPnbAeVHcCwwKAbhrYtc8qEyUMdgd2AUvznGyCck/1SHabouth1dGLOBQkD/TIIe6ccmcsXiK7DVMoRsiTaFIPUIxZ8h2t4G/fpdH/Ftv9er5/9GSgQOcrZ36ereKaGqs8DclMcEohkCcgH8GyQWiPbEMBtSdX5IGr072Nmk+Pcr4u0S2ON5hHghgKYkWuIEa9zr9xhIIvEsJqH9eeh7I4Bzucq06qqEMG3CZAGtsbV4IUuLYQXVd04tg0dwq3bHHUYapKwT3OunDNhw7xdwcWgesdBPsqxiP8U2UDkgJvfPXesAuAOg99AwWVQnpM2kDk6aEPtU9zCeVbVmUH3qYXHYguDLezoNWK/cjCsFkztTmq5Lc3sfe1eeelvY7yVsNQe9gFLQT1G00a1T2wejfIOSbxpMjDiagv4h4wG8j/f1v4/7a252DytuOqy4GSL/l/mom6zy9NMdhvO+OOi0e6I4TQSY+uqmyCKD18LaRLghMQThOaEAOMDErvXk1a5izb7uaxVOHpPMRh8vQ29NQFAPbdwfIMYkUkiAuHQiGBVxzUDo7oPb8Z1rkg2MDpK6t1tFbCLPEvR+Tsqc3krRx065uHYaGyR9se/hzzOlOvOamls4CbiuXgUg3XOnmOM4/u8rSgjbmq7Fq8nvKN9/7UHE59z5fP1vJiIyUstUx+QW9y5WDP8wOn2bBsJ82j+0X49Jmn4ogMIKKAMPUYwuJcYSMzV3tGv2XXTsZg8SUjUWFL0r6tgTnpxZKdnF39JDMScvtV198yIWJ8q98luUld9MJ7g1rmtvdYXe/3P5TbgKBnBkwwfsMEMFQ6NF5vmxCQ7H4GNTFQwzZE+RTxP5npRZ2AI/gibpdnBBWuZ5d0yR5WH4PbyJVV83HXGPJBPUQqELHJgU36+O5vkyuAdizwdcW9j1caHB7fmxVaBR6NP5JWwX+OZDjfu+00ugjSuOevnHV3g5iyPLBrSjQA5q2Nd6coAKEIVBa3tjBS0CbC/F52XNG3YgkdxHOX9PfrX02iS1jetpej4r68rN/02HTYqGwcZ2//s0TELmkOjiDFUsL6kPLimdj2BTMFusXBH8PvIno6o8+j8lHqVEaEdgVRL8f/tEk4z91NLS9JUtneKPEWl3R0gt4jcrHD1HO0mvGrud8EpztAd5Crh5MoYnGGY53bBQfVAHe3gLlrvaAzoGj5Lkn0OqktyhMFJiadiJpiBxGsDEydbFBESKdulGlaAhfCgAlgaRbU8FA1Yec64Rc4b1PgMhoWXUeJ0hEcEwExgHKt81XumkTFp9YH3rL2JoXlcQf31g=</Encrypted>]]>
      &EventsScript;
      &OutlineEntry;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzxgX4jLMXCAe9HW37raDZDq4CjBlYaRNRjZ7LuRuXFun8ELi2+Kh4l/pRgPM82JY1azoW1pKV55w2zdcHqKrROAESkGFRC1PdIl4enZMDHvoofF5H2qbhKJabyW2ooRIoNlNQpCIgq1Lgh3vQ0FPBbLuBfu0+K2wvtvNvbozFrI85nWD4g4H3lR2hFlLcxl9NbP2XxdRfOMV9yieOTHihyK9zPibzR5x8IL7u6aCT3d8GTOvFTzTLsuQ8KXjYsAmoOEcoASRBU4bde2u2SoVEMxaeq9HZUNCYipJrguwWAh</Encrypted>]]>
    </text>
  </css>
</dir>