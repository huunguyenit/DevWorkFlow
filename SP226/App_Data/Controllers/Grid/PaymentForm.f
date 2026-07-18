<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY TransferID "PaymentForm">
  <!ENTITY CreateTicket "declare @ticket varchar(32)
select @ticket = lower(replace(newid(),'-',''))
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', '', '', '@@appDatabaseName', getdate());">
]>

<grid table="dmmauunc" code="ma_mau" order="ma_mau" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo mẫu ủy nhiệm chi" e="Payment Form Definition"></title>
  <subTitle v="Cập nhật mẫu ủy nhiệm chi..." e="Update Payment Form..."></subTitle>
  <fields>
    <field name="ma_mau" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Mã mẫu" e="Code"></header>
    </field>
    <field name="xtype" isPrimaryKey="true" width="0" hidden ="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_mau%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mẫu" e="Description"></header>
    </field>
    <field name="in_nl_yn" width="80" align="right" allowSorting="true" allowFilter="true">
      <header v="In nhiều liên" e="Multiple Copie"></header>
    </field>
    <field name="mau_in_yn" type="Boolean" width="0" hidden ="true">
      <header v="" e=""></header>
    </field>
    <field name="mau_chuan" width="0" hidden ="true">
      <header v="" e=""></header>
    </field>
    <field name="mau_nl" width="0" hidden ="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_mau"/>
      <field name="xtype"/>
      <field name="ten_mau%l"/>
      <field name="in_nl_yn"/>
      <field name="mau_in_yn"/>
      <field name="mau_chuan"/>
      <field name="mau_nl"/>
    </view>
  </views>


  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJ6Z3osRRn7IZEXHQKbH7bt0hzgshCoBA59w1MttimR/mjDi7Ebfdn08ra8EACC0J+nTqRSngS8zDnENVQ26VrVy+Sz/Z4QcrF9bIZVcM8nE5PWmTPBjr2KWAMtL+QHJlQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAOHRyZVNDnrm/ltpsGKjzJS7Pvvzsj7MchtjWlnN9PFF9qbhbp9AKHXda7qAx0K3YLsno8zoqZflio+Dd7qdMI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtejV5eRs5mTK1RH8yDbHy7XCbqf8h77RHO7Hi3sPvUJJniBrmA8M3XqED5HfyThFYDYkY2WzTOsFm8O+s6wJ/+apPwthbYx/UulAjFUErYZY/6ujHDQ1iaPqASxaXKqtCPBX0+Yro8ZppsRK95kudum8oo0+Hp6qTvPkAJ+py3OMxWabBPL1D67nmGIqe73c79HDvMr54ro5uSzuHqHkLvekgogqyIAEv1SMUZ3QmjeBKOp0MyFvIIoM6AKGTTFKko6jXnru77t2g69lmdi8HBxLF7m4PGpl3TG9dQXZ5DkiAN17V70ABQNJi8AYV3/wOqYgkLE+vHFgP02iGf0qrNpE3qjdZSqCUD2O3szxxFKArcsq0ma6TUfCo3J+5lybeMZetRFw7+Y7+t0pCDScGNopWBoKMVxVNHAvEUn3NUNUHe8ICuMyPF7iPvo6W/0J4dQcS6aO/lEPVNL+8PvuKDkGuKYAP04Urxs/7oFqVPn++1DX2/rNwCryI+sBqwZH90EYIRuPg6MZcKVHlDcEcuFNiFpaMJJhulWC0UMaamyfo+76T0HH7GRq/6XpqTUutwMzrIGf6EJHkNn0Cmrr3ifXcZEeVg7DyDqsxNcZ4vXbyFWOPSsJ8qp8mhmk2ChWJm9i4cVEAy5Z/K1lhzOQKruhl+QjrA6iKrwYGEWu2LbLVdhzDoekpSdvXRQCyukWEYa3jXGBoX0mVRDCxfx4xgpdtIOXIswA1j+l4qqTWSAckSPKNXzdcpy3LeuhFof2ijQqhqrGxgNAlDAf2+WCGaIWMgXQD8NKb4jLzraH9Dl4agy/EEPn2RvIFECYZgL3EVlCZ/ursz2ol6uzooNMvm8Fd2ki+Bgqvj1LvhQ3bfg4</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&4Z3iXjUo/EHcYSchZnZy5ZgBkuYpOvpAcLG+9Pum9654TYf7aPYYMNgtd/jh6PI/p8D6bYo18TPH6hM39ZV9DwCmXx2vdyEBLCX4x2R/8pB84NgRQWq+yfjzB7iLDY6v7oIbBdnl/EfQK8CJ7AKfXsBovX1kxcHNvMPiMORMHmEBvps5WS820rV0/JTokzrfj06bod2HpVbXN2nV5SuQuv1+Z22GsWIsHxNBeNMjLmUDihb7m1ppgwydWWgk1tByB8LAYakSpjcEG142RZj+87JrANVWBYNveQRE3jXXt8DPvO65Kw6oX/vtDB6/ZDsirSP7LqtOndWFcM0+MCLg2Jj8Tw2w+VmLq7tN87oH4t3ZRa3juNlwPgb2fKDdNfLcqrk6tvL9o4C17c2cyRFyAtLrtEHkuMlxDu+vrD6b6YbjfTo2FMM7sIuLblY0xiLe/cf5wJqirwz9Nl1J/Z7v+TMUTGPYZZfTJQdtu2h/DkEb459IkPaCZA7d5YShnliHt7SzE7arLSi9a9veJWdrnrbrEpkOat57uRdxKeiOwywbLAgWd1e/F+Syfggemhw4iUFlbGt88E0/47dOplo6uAol8QGXmvmQiKba1ey9xEUxzdj42pze5Z1T2iyFp6OyHnth1IvfzImDH4JxyMv4/MDv44jqaMnNcSmY6BJPhijKw5pA8S685qjnHAqbCyMd/vssgbGUlYf3aB/hqjQoLg==</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu285PMrkAgKSyb/y4npBkWFfYiXv6jMV+0hNy7kvxCxyoUkp4wSM63ofSEZzLxKHEn068vjKMo88OlwHyMCKkxIU28qry17+MV9OO2VMoASRFVnZ0se5VLM2sXjHiMiQZagJsgkw0MDNf4VURbBtB+zXCzZ0jZzvc8XfBUf3RPPO</Encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu57T4PcXRvMbsOHckmf6v3x0T22hMYvElWJ4AkHIn+qA/8qi2p1lwhaaeS7Y0MYt6PARY0IIZIMXMAroVVuWovuQU5+Kn51j8WLumAays5sog34PdSZsBlXbHrvZdQls0Y5HzE/geg7BGKxfm3uZDgI2lRVjIuvAU0PDQHNNoxkP35Yu+3T3+QjOAAIgRAcijmtOyq1m7YFhTuEf5f4YAWSrM3r2L6RNzPG6FfxsAl4RwcNcfQmkAoBUYdkFNy1U36kEliULwc+9dFAkrFQWV8Gbr3xafZuSO5fAG4Mc5tKYve4KSIYca56vqtjGVJo51N8G1I3wdgHY/Gj9BDdyfi/vFNCNa8MTok5ZJFHql5nC+tPHPFWa/LpOIr6KtoaPie18cgBb24H7zDJOuewWxPY=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFJ1hD+/4kMjz/2qiECiX++vkFzPyPZtIXsZZ8liTPLB6sBKJTWSiHwmTT8Zjdwp3YVPDwlM6RXjga2OhzT2rdBVuypViHdY4NpAvLJfA0IVl</Encrypted>]]>
      </text>
    </action>

    <action id="Update">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6+5vy5VNNR4Uf9VrkVHnBHaE+gQ2CbZY4Qd+azkOcMLtWt20l59YaK5JrCmOtk1xXQXssdRyOZ+KsUmZ2zzDDGQFgHZBbM/uT4TmQ7fhRaA75FTmcCWbm2D/mSz5UUaud3hSiyVjuZ+O7YStGKG1eiK3b6/OS5+jGE1KjFGsDWAmCiz2InCWhGR1c1ZRKh1w8Cm6EsV75zkFRQn5WYXrW9tB9PIDRIa5/hMacAb7dptDqrALnWB2231FUz4hBa0Tg==</Encrypted>]]>
      </text>
    </action>

  </response>

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
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="Upload">
      <title v="Tải lên" e="Upload"></title>
    </button>
    <button command="Download">
      <title v="Tải xuống" e="Download"/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>