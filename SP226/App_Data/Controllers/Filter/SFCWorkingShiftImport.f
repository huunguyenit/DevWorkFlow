<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "SFCWorkingShiftImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">
]>

<dir table="sfdmcummay" code="ma_cm" order="ma_cm" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lấy dữ liệu từ tệp" e="Import Data From File"></title>

  <fields>
    &UploadField;
    <field name="type" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kiểu sao chép" e="Type"></header>
      <footer v="1 - Chép đè, 0 - Không" e="1 - Overwrite, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ticket" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30"/>
      <item value="1100010: [upload].Label, [upload], [upload].Description"/>
      <item value="1110001: [type].Label, [type], [type].Description, [ticket]"/>
    </view>
  </views>

  <commands>
    &UploadCommand;

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VKaBUrspbPJs/UZF6A52n6B9qb9EXsh+IKi8uYanRXhzxkt+nwaAIIOO54f6eIeRtYC1gJtTX1OQVkh00meUCo6dzmk/bRPBEg8mKhSlSZg/8sBGopZqpckmIOeyiD8sg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3pzmE5chSLTUsRU/oQi8qvIvTBRzoIephrRkZtXbFyoIrBELwMw5+m6gUxWzpcVL2LHh/Sf1f1lPH0Mj8Cye+hD09y4FXRK7ap20f9QmL5AO810cPdM2uWBYyrwSvlS82/xE2g4u3L2w2Ymt+UsTCJ1YC+JC9A75+/qZ9F3aMcTTQ4Hy9V/Yqa5WTNlSYRsDJEs2K/jwlz58xleu43D8MVndr0nz82BpyLXglSLy9zKHvjv5WL4Jmlt1fqCB1oQLPLvEgaOC0DqmR544CSoUSrxrCh/9zxaqENYSH3SAOFyYcWBquKvYi+9o+BVxtjvB52l2E9365HF0xX0lREpSuGybNMUyWTQndoC+68K2xcnzFshCQV/lvIuqPyC3+Uf1Rg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&C2oX7For6o4fC973pcIHen0j9YbEHEW755WtDsyQJq8tfWc2rOYjVd+QP/ZpbjAh</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&40Tg4Lrc/5UuRfmdgw9mHKa1LjQCGJrS8vtg2pXXfKx0yf82cur09BgIqrBqeLZa0vvlvzROF1HHjCPGbOE/VYoW6STeHMPir27Wd4e7v+uQEGOd7BO5uaUGFWSzTvFDEF/lXAe039x8b6vAV5IpkLS1j0jfU7AEFVfYUk73uNIFLVbcrx4AWYQVzAna99yuoV9p+OU5Ohq+EiYv3DnzeRh9hG9CR4qUsv4VPpnuyF8UCFyQwh/wW8TOgHOYl+WclEjvC1yAdo0Pu+wqbNiBZNVuy/QNLS/pVT5ChzgrNx2a5fxxndPQHk7UiHkNtCCa53r7SKKN1M2ZTr9Ml/1+rhjZulcy1b+vKHEe8dPAInpa1brwHc6itB9iriLxMqfGDdlcNHe3B//KYu9JmOXEaBZWCMsS/RXS1y2IV8C80zKueHOlaV5iJJ57VshVb8SsWVr1P9kTdH03QxzlIjdqRwqxH+IRUL/tGIvyG1pheAOQsqUVoeSstEGST87o6KwfUL23hfbp1AGfjRzSn7rsboesaaru8ELGChJd2RGdsNc=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &UploadScript;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYreKa4/FdUvAcKPIuh0/y3Rio0AigvPLuXO/MHeQX85sySrdbs7aYaq32DVM6ulJTbusevIKgB7hqcKSdXyPaB+Vk2S6qo08z6ynPvziNxXd0t8uJnMX9iQ1cziAIQOz65ARaqWke4PZDj06jpKxG+d9eSRSHG99W+n24oyXr/2b9HOtvi9KglzUQaHLhNUxNDYnWfR1p08bohrKu8g3UyabFCvI//2+F6Za55hfU6sLELcWLM4cKCBOvKmBNuwC0Xg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHaKWwx1w+WQg6f7c0Ou7rMu+VZwVM5aenHFkSuK7c9JF8zlHtKwfwTbtcahkAfua/SwlW94CtaTtdYhzizhpWJ1iWXahJrLG6r9pnzh+yjhvH2B9AbC3gGjvZsyouqrw2ACDEcSNQsHTy4BP1s/hpvIFHhqfusSMfE+MfcooOE7QTf7hIR7/gKcqG5DNsKHOy0uL2LNGfZ0GUN0CnNxvxC857UjeLRsb7mOZ79eLrxJz</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetTicket">
      <text>
        &UploadCreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>