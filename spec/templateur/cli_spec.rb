require 'rspec'
require 'templateur/cli'
require 'tempfile'

describe Templateur::CLI do
  def write_tempfile(contents)
    tmp = Tempfile.new
    tmp.write(contents)
    tmp.close

    tmp.path
  end

  it 'renders YAML templates' do
    template = <<~END
    ---
    zero: my-special-value
    one: {{parameter-one}}
    two: {{parameter-two}}
    END

    parameters = <<~END
    ---
    parameter-one: parameter-one-value
    parameter-two: |
      parameter-two-value
      parameter-two-value
    END

    expected_output = <<~END
    ---
    zero: my-special-value
    one: parameter-one-value
    two: |
      parameter-two-value
      parameter-two-value
    END

    template_path = write_tempfile(template)
    parameters_path = write_tempfile(parameters)

    expect {
      subject.run('--yaml', template_path, parameters_path)
    }.to output(expected_output).to_stdout
  end

  it 'renders JSON templates' do
    template = <<~END
    {
      "zero": "my-special-value",
      "one": {{parameter-one}}
    }
    END

    parameters = <<~END
    {
      "parameter-one": "parameter-one-value"
    }
    END

    expected_output = <<~END
    {
      "zero": "my-special-value",
      "one": "parameter-one-value"
    }
    END

    template_path = write_tempfile(template)
    parameters_path = write_tempfile(parameters)

    expect {
      subject.run('--json', template_path, parameters_path)
    }.to output(expected_output).to_stdout
  end
end
