<?xml version="1.0" encoding="utf-8"?>

<grid table="dmpb" type="Detail" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="ds_tk_no" external="true" defaultValue="''" dataFormatString="@upperCaseFormat" width="200">
      <header v="Ds tài khoản nợ" e="Debit Account"></header>
      <items style="Mask"></items>
    </field>
    <field name="ds_tk_co" external="true" defaultValue="''" dataFormatString="@upperCaseFormat" width="200">
      <header v="Ds tài khoản có" e="Credit Account"></header>
      <items style="Mask"></items>
    </field>
    <field name="cong_tru" type="Byte" width="100" dataFormatString="1, 0" clientDefault="1" align="right">
      <header v="Cộng/trừ (1/0)" e="Interest (1/0)"></header>
      <items style="Mask"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ds_tk_no"/>
      <field name="ds_tk_co"/>
      <field name="cong_tru"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiF9PytaniaXIjIGKSeOFuMYFtA4OUTL74IeozRF422tzEO3ANlN95gGASh9OUHRdFESgJzjJTVE2hWLOSbIol0LuyqMUjFuDj08cQS7zgIgZ</encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiP29ach59PzSYT8klIpfCpWeYq0ozjVXuLxeSw/L8F6UzVO/6+VFBcAQORtVehbI+sAV+QPwFe+cagDBujF+PeZHmcZzZ9n8GnpSDrKSoKap</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiPfDbQH+eNOEniFMwhrnDUHv8wgywv9tznbfBK0nPcgxPJyKq3IAQwgFOuWM3rbbCMgg9NLawTsLPtFJaXtw8710PHDlp/DeEGPoua3GHvV+</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hnZNcOGwpVVW0Ir2W3J6asQ2Crs4KBoJhzL1WyK1/niyFghq1VkRRaZOhi4LOdkrqmLn8k5ezx0RQd+f3OpLIvYBxKsaj0Bh9aKUgiKS7JE+hNmPMkPTbFfz/xgJR1QYv4p6Cyw6vWr4sSSUhcjEeoWFabT0m3w+v4yJmDflrFNfbDxoIf5MvRRTK6ibCGYDxsZ1lJGUmS+PHexptYu+ta7NlOmOjXvvxBnp8d70Mf0J5JDngRqAYy1krOI8c9XxdMSsGXqNrkB5tty2n056+tFV+PsGRMXkBSl0unduPtpIgvYM4On4wr9/C3ZmigFoVvTb2nTTKWDBi4yCRWmmYWsn3Wwk/SuN1DjDAHoNly4c5KuSy/pK2HjLZskLyuYzffBtTzGislxcRg95JNhISxwcVj+6n3Z/c7pAngpV7bAPeIC3ZLIxL+fCn+MwslXMTvowUB4XPJmgBXllcyGkqwQYjTllTQdnhaBguN1xzwMidNaJjFdYYacEvk0lFjUVM8WHO9bwo+ohISk4q/XQ94AgYd02mUIIhtivN1cZdTQpfyaWQsn+rG1xI/MzjDuTGWq0uRRQxS9cwZgbz2Mfc8FiBnfeTJp0qRhLhjmkpi4k5pxWk6vMDXfIGZ5e19ZAR/8eK4EzGx02ie6UEovY/wXVOFS+ErNwehfm9oWKTGtDr0F1PdmuxpC+Ds66ZCLEjdqAO5YAAhEfL03/RIDFfxm</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event ="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/fsRI8mzGWNdVkRssysgkP1x9145IGDmGoQjL4hFTdfPPhgUPnoEVghB3UR8l5kLBT+2iEtb7xALjGIKhOfS4Y=</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>